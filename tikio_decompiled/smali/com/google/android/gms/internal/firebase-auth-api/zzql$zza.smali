.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/firebase-auth-api/zzql;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zza:Ljava/lang/Integer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private zzb:Ljava/lang/Integer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

.field private zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza:Ljava/lang/Integer;

    .line 58
    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb:Ljava/lang/Integer;

    .line 59
    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 60
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqn;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza:Ljava/lang/Integer;

    return-object p0
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    return-object p0
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    return-object p0
.end method

.method public final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza:Ljava/lang/Integer;

    if-eqz v0, :cond_f

    .line 11
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb:Ljava/lang/Integer;

    if-eqz v1, :cond_e

    .line 13
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-eqz v1, :cond_d

    .line 15
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    if-eqz v1, :cond_c

    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x10

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_b

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    const/16 v4, 0xa

    if-lt v0, v4, :cond_a

    .line 24
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne v1, v4, :cond_1

    const/16 v1, 0x14

    if-gt v0, v1, :cond_0

    goto/16 :goto_0

    .line 26
    :cond_0
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; can be at most 20 bytes for SHA1"

    .line 28
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 30
    :cond_1
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne v1, v4, :cond_3

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_2

    goto :goto_0

    .line 32
    :cond_2
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; can be at most 28 bytes for SHA224"

    .line 34
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 36
    :cond_3
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne v1, v4, :cond_5

    const/16 v1, 0x20

    if-gt v0, v1, :cond_4

    goto :goto_0

    .line 38
    :cond_4
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; can be at most 32 bytes for SHA256"

    .line 40
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 42
    :cond_5
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne v1, v4, :cond_7

    const/16 v1, 0x30

    if-gt v0, v1, :cond_6

    goto :goto_0

    .line 44
    :cond_6
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; can be at most 48 bytes for SHA384"

    .line 46
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_7
    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    if-ne v1, v4, :cond_9

    const/16 v1, 0x40

    if-gt v0, v1, :cond_8

    .line 55
    :goto_0
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    iget-object v8, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    const/4 v9, 0x0

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;-><init>(IILcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;Lcom/google/android/gms/internal/firebase-auth-api/zzqp;)V

    return-object v0

    .line 50
    :cond_8
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; can be at most 64 bytes for SHA512"

    .line 52
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_9
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "unknown hash type; must be SHA256, SHA384 or SHA512"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_a
    new-instance v1, Ljava/security/GeneralSecurityException;

    new-array v3, v3, [Ljava/lang/Object;

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "Invalid tag size in bytes %d; must be at least 10 bytes"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 18
    :cond_b
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza:Ljava/lang/Integer;

    aput-object v3, v1, v2

    const-string v2, "Invalid key size in bytes %d; must be at least 16 bytes"

    .line 19
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 16
    :cond_c
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "variant is not set"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 14
    :cond_d
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "hash type is not set"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_e
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "tag size is not set"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10
    :cond_f
    new-instance v0, Ljava/security/GeneralSecurityException;

    const-string v1, "key size is not set"

    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb:Ljava/lang/Integer;

    return-object p0
.end method
