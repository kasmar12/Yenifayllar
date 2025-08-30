.class public final Lcom/google/firebase/firestore/MemoryEagerGcSettings;
.super Ljava/lang/Object;
.source "MemoryEagerGcSettings.java"

# interfaces
.implements Lcom/google/firebase/firestore/MemoryGarbageCollectorSettings;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/MemoryEagerGcSettings$Builder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/MemoryEagerGcSettings$1;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/google/firebase/firestore/MemoryEagerGcSettings;-><init>()V

    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/MemoryEagerGcSettings$Builder;
    .locals 2

    .line 64
    new-instance v0, Lcom/google/firebase/firestore/MemoryEagerGcSettings$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/firebase/firestore/MemoryEagerGcSettings$Builder;-><init>(Lcom/google/firebase/firestore/MemoryEagerGcSettings$1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    if-eqz p1, :cond_2

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    if-eq v1, p1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 1

    .line 45
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string v0, "MemoryEagerGcSettings{}"

    return-object v0
.end method
