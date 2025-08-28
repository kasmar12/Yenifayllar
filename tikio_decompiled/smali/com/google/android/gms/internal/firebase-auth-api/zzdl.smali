.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzdl;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzdb;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zza;
    }
.end annotation


# instance fields
.field private final zza:I

.field private final zzb:I

.field private final zzc:I

.field private final zzd:I

.field private final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

.field private final zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;


# direct methods
.method private constructor <init>(IIIILcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzdb;-><init>()V

    .line 16
    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    .line 17
    iput p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    .line 18
    iput p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    .line 19
    iput p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    .line 20
    iput-object p5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    .line 21
    iput-object p6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    return-void
.end method

.method synthetic constructor <init>(IIIILcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zzdn;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;-><init>(IIIILcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;)V

    return-void
.end method

.method public static zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zza;
    .locals 2

    .line 11
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zza;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zza;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzdm;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 23
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 25
    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;

    .line 27
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    .line 29
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    if-ne v0, v2, :cond_1

    .line 31
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    .line 33
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    if-ne v0, v2, :cond_1

    .line 35
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    .line 37
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    if-ne v0, v2, :cond_1

    .line 39
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    .line 41
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    if-ne v0, v2, :cond_1

    .line 43
    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    .line 45
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    if-ne v0, v2, :cond_1

    .line 47
    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    .line 49
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 5
    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;

    aput-object v2, v0, v1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 10
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 8

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    iget v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    iget v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "AesCtrHmacAead Parameters (variant: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", hashType: "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte IV, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte tags, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte AES key, and "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte HMAC key)"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()Z
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

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
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zza:I

    return v0
.end method

.method public final zzc()I
    .locals 1

    .line 2
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzb:I

    return v0
.end method

.method public final zzd()I
    .locals 1

    .line 3
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzc:I

    return v0
.end method

.method public final zze()I
    .locals 1

    .line 4
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzd:I

    return v0
.end method

.method public final zzg()Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zzf:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzb;

    return-object v0
.end method

.method public final zzh()Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzdl;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzdl$zzc;

    return-object v0
.end method
