.class public final Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
.super Ljava/lang/Object;
.source "FirebaseFirestoreSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    }
.end annotation


# static fields
.field public static final CACHE_SIZE_UNLIMITED:J = -0x1L

.field static final DEFAULT_CACHE_SIZE_BYTES:J = 0x6400000L

.field public static final DEFAULT_HOST:Ljava/lang/String; = "firestore.googleapis.com"

.field static final MINIMUM_CACHE_BYTES:J = 0x100000L


# instance fields
.field private cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

.field private final cacheSizeBytes:J

.field private final host:Ljava/lang/String;

.field private final persistenceEnabled:Z

.field private final sslEnabled:Z


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)V
    .locals 2

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$600(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    .line 237
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$700(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    .line 238
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$800(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    .line 239
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$900(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    .line 240
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$1000(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Lcom/google/firebase/firestore/LocalCacheSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;Lcom/google/firebase/firestore/FirebaseFirestoreSettings$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z
    .locals 0

    .line 25
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    return p0
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z
    .locals 0

    .line 25
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    return p0
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)J
    .locals 2

    .line 25
    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Lcom/google/firebase/firestore/LocalCacheSettings;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_6

    .line 246
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 248
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    .line 250
    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    iget-boolean v2, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    if-eq v1, v2, :cond_2

    return v0

    .line 251
    :cond_2
    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    iget-boolean v2, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    if-eq v1, v2, :cond_3

    return v0

    .line 252
    :cond_3
    iget-wide v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    iget-wide v3, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_4

    return v0

    .line 253
    :cond_4
    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v0

    .line 254
    :cond_5
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    iget-object p1, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_6
    :goto_0
    return v0
.end method

.method public getCacheSettings()Lcom/google/firebase/firestore/LocalCacheSettings;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 344
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    return-object v0
.end method

.method public getCacheSizeBytes()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 321
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    if-eqz v0, :cond_2

    .line 322
    instance-of v1, v0, Lcom/google/firebase/firestore/PersistentCacheSettings;

    if-eqz v1, :cond_0

    .line 323
    check-cast v0, Lcom/google/firebase/firestore/PersistentCacheSettings;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/PersistentCacheSettings;->getSizeBytes()J

    move-result-wide v0

    return-wide v0

    .line 325
    :cond_0
    check-cast v0, Lcom/google/firebase/firestore/MemoryCacheSettings;

    .line 326
    invoke-virtual {v0}, Lcom/google/firebase/firestore/MemoryCacheSettings;->getGarbageCollectorSettings()Lcom/google/firebase/firestore/MemoryGarbageCollectorSettings;

    move-result-object v1

    instance-of v1, v1, Lcom/google/firebase/firestore/MemoryLruGcSettings;

    if-eqz v1, :cond_1

    .line 327
    invoke-virtual {v0}, Lcom/google/firebase/firestore/MemoryCacheSettings;->getGarbageCollectorSettings()Lcom/google/firebase/firestore/MemoryGarbageCollectorSettings;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/MemoryLruGcSettings;

    .line 328
    invoke-virtual {v0}, Lcom/google/firebase/firestore/MemoryLruGcSettings;->getSizeBytes()J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0

    .line 335
    :cond_2
    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    return-wide v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 259
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 260
    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 261
    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 262
    iget-wide v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    const/16 v3, 0x20

    ushr-long v3, v1, v3

    xor-long/2addr v1, v3

    long-to-int v2, v1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 263
    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public isPersistenceEnabled()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 305
    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    if-eqz v0, :cond_0

    .line 306
    instance-of v0, v0, Lcom/google/firebase/firestore/PersistentCacheSettings;

    return v0

    .line 309
    :cond_0
    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    return v0
.end method

.method public isSslEnabled()Z
    .locals 1

    .line 294
    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FirebaseFirestoreSettings{host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", sslEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", persistenceEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", cacheSizeBytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", cacheSettings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "null"

    goto :goto_0

    .line 283
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSettings:Lcom/google/firebase/firestore/LocalCacheSettings;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
