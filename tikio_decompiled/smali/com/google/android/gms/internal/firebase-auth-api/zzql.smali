.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzql;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzqq;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    }
.end annotation


# instance fields
.field private final zza:I

.field private final zzb:I

.field private final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

.field private final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;


# direct methods
.method private constructor <init>(IILcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqq;-><init>()V

    .line 26
    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    .line 27
    iput p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    .line 28
    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 29
    iput-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    return-void
.end method

.method synthetic constructor <init>(IILcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;Lcom/google/android/gms/internal/firebase-auth-api/zzqp;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;-><init>(IILcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)V

    return-void
.end method

.method public static zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    .locals 2

    .line 21
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqn;)V

    return-object v0
.end method

.method private final zzg()I
    .locals 2

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-ne v0, v1, :cond_0

    .line 5
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-ne v0, v1, :cond_1

    .line 9
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    :goto_0
    add-int/lit8 v0, v0, 0x5

    return v0

    .line 11
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-ne v0, v1, :cond_2

    .line 13
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    goto :goto_0

    .line 15
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-ne v0, v1, :cond_3

    .line 17
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    goto :goto_0

    .line 19
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknown variant"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 31
    instance-of v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 33
    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    .line 35
    iget v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    .line 37
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    if-ne v0, v2, :cond_1

    .line 39
    invoke-direct {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzg()I

    move-result v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzg()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 40
    iget-object v0, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 42
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-ne v0, v2, :cond_1

    .line 44
    iget-object p1, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 46
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 20
    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    aput-object v2, v0, v1

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 6

    .line 24
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "HMAC Parameters (variant: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", hashType: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte tags, and "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "-byte key)"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()Z
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

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
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzb:I

    return v0
.end method

.method public final zzc()I
    .locals 1

    .line 2
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zza:I

    return v0
.end method

.method public final zze()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    return-object v0
.end method

.method public final zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    return-object v0
.end method
