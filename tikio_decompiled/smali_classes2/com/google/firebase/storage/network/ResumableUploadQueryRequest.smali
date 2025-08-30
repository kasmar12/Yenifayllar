.class public Lcom/google/firebase/storage/network/ResumableUploadQueryRequest;
.super Lcom/google/firebase/storage/network/ResumableNetworkRequest;
.source "ResumableUploadQueryRequest.java"


# instance fields
.field private final uploadURL:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Landroid/net/Uri;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/storage/network/ResumableNetworkRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;)V

    .line 31
    iput-object p3, p0, Lcom/google/firebase/storage/network/ResumableUploadQueryRequest;->uploadURL:Landroid/net/Uri;

    const-string p1, "X-Goog-Upload-Protocol"

    const-string p2, "resumable"

    .line 33
    invoke-super {p0, p1, p2}, Lcom/google/firebase/storage/network/ResumableNetworkRequest;->setCustomHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Goog-Upload-Command"

    const-string p2, "query"

    .line 34
    invoke-super {p0, p1, p2}, Lcom/google/firebase/storage/network/ResumableNetworkRequest;->setCustomHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getAction()Ljava/lang/String;
    .locals 1

    const-string v0, "POST"

    return-object v0
.end method

.method public getURL()Landroid/net/Uri;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/google/firebase/storage/network/ResumableUploadQueryRequest;->uploadURL:Landroid/net/Uri;

    return-object v0
.end method
