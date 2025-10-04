## Demo 1: Path-Based Routing Using Ingress on Amazon EKS  
**Author: Abhishek Mishra**

```mermaid
flowchart TD
    subgraph Internet
        User[User: Shwetangi]
        User --> LB[ALB: <lb-dnsname>]
    end

    subgraph AWS[Amazon EKS Cluster (us-east-2)]
        subgraph AZ1[Availability Zone: us-east-2a]
            Node1[Worker Node 1 (t3.small)]
            Node2[Worker Node 2 (t3.small)]
        end
        subgraph AZ2[Availability Zone: us-east-2b]
            Node3[Worker Node 3 (t3.small)]
            Node4[Worker Node 4 (t3.small)]
        end
    end

    LB --> Ingress[Ingress Resource (app1-ingress)]
    Ingress --> Controller[ALB Ingress Controller]

    Controller --> iphone[iphone-svc (/iphone)]
    Controller --> android[android-svc (/android)]
    Controller --> desktop[desktop-svc (/)]

    iphone --> Pod1[Pod (port 5678)]
    android --> Pod2[Pod (port 5678)]
    desktop --> Pod3[Pod (port 5678)]

    classDef svc fill:#00bcd4,color:#fff,stroke:#333,stroke-width:1px;
    class iphone,android,desktop svc;
