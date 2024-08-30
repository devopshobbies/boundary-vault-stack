from diagrams import Diagram, Cluster, Edge, Node
from diagrams.onprem.compute import Server
from diagrams.onprem.auth import Boundary
from diagrams.onprem.security import Vault
from diagrams.onprem.database import PostgreSQL
from diagrams.oci.governance import Audit, Logging


graph_attr = {
    "fontname": "Roboto",
    "fontsize": "24"
    }

with Diagram("Boundary server Workflow", show=False, direction="LR", graph_attr=graph_attr, filename="boundary"):
    boundary_controller = Boundary("Boundary Controller")
    boundary_worker = Boundary("Boundary Worker")
    vault = Vault("Vault Transit Engine")

    with Cluster("Listeners"):
        api_listener = Server("API Listener")
        cluster_listener = Server("Cluster Listener")
        proxy_listener = Server("Proxy Listener")
        Node(label="", width="2", height="0", style="invisible")

        
    with Cluster("Audit Event Sinks"):
        audit_file_sink = Audit("Controller")
        auth_sink = Audit("Auth Observation")
        session_sink = Audit("Session Authorization")
        Node(label="", width="2", height="0", style="invisible")
    stderr_sink = Logging("Stderr Sink")

    with Cluster("KMS Keys"):
        recovery_key = Boundary("recovery")
        worker_auth = Boundary("worker-ath")
        root_key = Boundary("root")

    postgres= PostgreSQL("Postgresql")    
    
    # Controller connections
    boundary_controller >> Edge(label="TCP connection") >> cluster_listener
    boundary_controller >> Edge(label="Audit File Events") >> auth_sink
    boundary_controller >> Edge(label="All-events") >> stderr_sink

    # Worker connections
    boundary_worker >> Edge(label="Connected to Controller") >> boundary_controller
    
    # KMS connections
    worker_auth >> Edge() >> vault
    recovery_key >> Edge() >> vault
    root_key >> Edge() >> vault
    root_key << Edge(attrs="penwidth: 2.0") << boundary_controller

    # DB connections
    postgres << Edge(label="DB Connection") << boundary_controller