.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzir;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzjb;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzir$zza;
    }
.end annotation


# instance fields
.field private final zza:I

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;


# direct methods
.method private constructor <init>(ILcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;)V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzjb;-><init>()V

    .line 7
    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    .line 8
    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    return-void
.end method

.method synthetic constructor <init>(ILcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zziu;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzir;-><init>(ILcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;)V

    return-void
.end method

.method public static zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzir$zza;
    .locals 2

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzir$zza;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzir$zza;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzit;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 10
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzir;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 12
    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzir;

    .line 14
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    .line 16
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    if-ne v0, v2, :cond_1

    .line 18
    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 2
    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzir;

    aput-object v2, v0, v1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AesSiv Parameters (variant: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte key)"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()Z
    .locals 2

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final zzb()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zza:I

    return v0
.end method

.method public final zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;
    .locals 1

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzir;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzir$zzb;

    return-object v0
.end method
