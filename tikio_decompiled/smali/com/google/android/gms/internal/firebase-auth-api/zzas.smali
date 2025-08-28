.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzas;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field zza:Lcom/google/android/gms/internal/firebase-auth-api/zzav;

.field private zzb:[Ljava/lang/Object;

.field private zzc:I

.field private zzd:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x4

    .line 25
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzas;-><init>(I)V

    return-void
.end method

.method constructor <init>(I)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    mul-int/lit8 p1, p1, 0x2

    .line 28
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzb:[Ljava/lang/Object;

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    .line 30
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzd:Z

    return-void
.end method

.method private final zza(I)V
    .locals 2

    shl-int/lit8 p1, p1, 0x1

    .line 32
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzb:[Ljava/lang/Object;

    array-length v1, v0

    if-le p1, v1, :cond_0

    .line 33
    array-length v1, v0

    .line 34
    invoke-static {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzam;->zza(II)I

    move-result p1

    .line 35
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzb:[Ljava/lang/Object;

    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzd:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/firebase-auth-api/zzas;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/util/Map$Entry<",
            "+TK;+TV;>;>;)",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzas<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_0

    .line 2
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zza(I)V

    .line 3
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 5
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 6
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    add-int/lit8 v2, v2, 0x1

    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zza(I)V

    .line 7
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzai;->zza(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzb:[Ljava/lang/Object;

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    mul-int/lit8 v4, v3, 0x2

    aput-object v1, v2, v4

    mul-int/lit8 v1, v3, 0x2

    add-int/lit8 v1, v1, 0x1

    .line 9
    aput-object v0, v2, v1

    add-int/lit8 v3, v3, 0x1

    .line 10
    iput v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzat;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzat<",
            "TK;TV;>;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzav;

    if-nez v0, :cond_1

    .line 16
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzc:I

    .line 17
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzb:[Ljava/lang/Object;

    const/4 v2, 0x1

    .line 18
    iput-boolean v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zzd:Z

    .line 20
    invoke-static {v0, v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaw;->zza(I[Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzas;)Lcom/google/android/gms/internal/firebase-auth-api/zzaw;

    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzas;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzav;

    if-nez v1, :cond_0

    return-object v0

    .line 22
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zza()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 15
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzav;->zza()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method
