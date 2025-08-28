.class public final Lcom/google/firebase/firestore/PersistentCacheSettings;
.super Ljava/lang/Object;
.source "PersistentCacheSettings.java"

# interfaces
.implements Lcom/google/firebase/firestore/LocalCacheSettings;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;
    }
.end annotation


# instance fields
.field private final sizeBytes:J


# direct methods
.method private constructor <init>(J)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-wide p1, p0, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    return-void
.end method

.method synthetic constructor <init>(JLcom/google/firebase/firestore/PersistentCacheSettings$1;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/PersistentCacheSettings;-><init>(J)V

    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;
    .locals 2

    .line 35
    new-instance v0, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;-><init>(Lcom/google/firebase/firestore/PersistentCacheSettings$1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 49
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/PersistentCacheSettings;

    .line 51
    iget-wide v2, p0, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    iget-wide v4, p1, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getSizeBytes()J
    .locals 2

    .line 74
    iget-wide v0, p0, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 56
    iget-wide v0, p0, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PersistentCacheSettings{sizeBytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/firebase/firestore/PersistentCacheSettings;->sizeBytes:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
