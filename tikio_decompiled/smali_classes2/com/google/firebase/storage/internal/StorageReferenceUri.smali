.class public Lcom/google/firebase/storage/internal/StorageReferenceUri;
.super Ljava/lang/Object;
.source "StorageReferenceUri.java"


# instance fields
.field private final gsUri:Landroid/net/Uri;

.field private final httpBaseUri:Landroid/net/Uri;

.field private final httpUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/google/firebase/storage/internal/StorageReferenceUri;-><init>(Landroid/net/Uri;Lcom/google/firebase/emulators/EmulatedServiceSettings;)V

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Lcom/google/firebase/emulators/EmulatedServiceSettings;)V
    .locals 2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->gsUri:Landroid/net/Uri;

    if-nez p2, :cond_0

    .line 40
    sget-object p2, Lcom/google/firebase/storage/network/NetworkRequest;->PROD_BASE_URL:Landroid/net/Uri;

    goto :goto_0

    .line 41
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    invoke-virtual {p2}, Lcom/google/firebase/emulators/EmulatedServiceSettings;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/google/firebase/emulators/EmulatedServiceSettings;->getPort()I

    move-result p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "/v0"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 41
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->httpBaseUri:Landroid/net/Uri;

    .line 45
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v1, "b"

    invoke-virtual {p2, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    .line 49
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/storage/internal/Slashes;->normalizeSlashes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "/"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "o"

    .line 51
    invoke-virtual {p2, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    .line 54
    :cond_1
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->httpUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public getGsUri()Landroid/net/Uri;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->gsUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getHttpBaseUri()Landroid/net/Uri;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->httpBaseUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getHttpUri()Landroid/net/Uri;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/google/firebase/storage/internal/StorageReferenceUri;->httpUri:Landroid/net/Uri;

    return-object v0
.end method
