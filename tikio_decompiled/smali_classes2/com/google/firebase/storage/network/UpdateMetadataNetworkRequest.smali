.class public Lcom/google/firebase/storage/network/UpdateMetadataNetworkRequest;
.super Lcom/google/firebase/storage/network/NetworkRequest;
.source "UpdateMetadataNetworkRequest.java"


# instance fields
.field private final metadata:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Lorg/json/JSONObject;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/storage/network/NetworkRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;)V

    .line 32
    iput-object p3, p0, Lcom/google/firebase/storage/network/UpdateMetadataNetworkRequest;->metadata:Lorg/json/JSONObject;

    const-string p1, "X-HTTP-Method-Override"

    const-string p2, "PATCH"

    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/storage/network/UpdateMetadataNetworkRequest;->setCustomHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getAction()Ljava/lang/String;
    .locals 1

    const-string v0, "PUT"

    return-object v0
.end method

.method protected getOutputJSON()Lorg/json/JSONObject;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/google/firebase/storage/network/UpdateMetadataNetworkRequest;->metadata:Lorg/json/JSONObject;

    return-object v0
.end method
