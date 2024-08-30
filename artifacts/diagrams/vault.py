from diagrams import Diagram, Cluster, Edge, Node
from diagrams.onprem.security import Vault
from diagrams.generic.storage import Storage
from diagrams.onprem.client import Users

with Diagram("\nVault Server Workflow",  show=False, direction="RL", graph_attr={"fontname" : "arial", "fontsize": "28" }, filename="vault"):
    cluster_attr= {
        "margin" : "20",
        "fontsize": "16",
        "fontname" : "arial"}

    with Cluster("Vault Setup",  graph_attr=cluster_attr):
        vault_listener = Vault("TCP Listener")
        storage_raft = Storage("\nRaft Storage")
        vault_ui = Vault("UI")

    with Cluster("User Management", graph_attr=cluster_attr):
        userpass_lockout = Users("\nUserpass Lockout")
        users = Users("\nUsers")

    # Vault connections
    vault_listener - Edge(label="0.0.0.0:8200\nTLS Disabled") >> [storage_raft, vault_ui]
    vault_listener >> Edge(label="Max Entry Size\n1MB") >> storage_raft

    # User Management connections
    users >> Edge(label="Lockout Threshold: 3\nLockout Duration: 10m") >> userpass_lockout

    # External connections
    api_addr = Vault("API Address\nhttp://localhost:8200")
    cluster_addr = Vault("Cluster Address\nhttp://127.0.0.1:8201")

    vault_listener >> Edge(label="API and Cluster Addresses") >> [api_addr, cluster_addr]
