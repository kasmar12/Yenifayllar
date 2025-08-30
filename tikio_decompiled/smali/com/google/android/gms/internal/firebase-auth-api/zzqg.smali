.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzqg;
.super Lcom/google/android/gms/internal/firebase-auth-api/zznb;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/firebase-auth-api/zznb<",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzuc;",
        ">;"
    }
.end annotation


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/firebase-auth-api/zzod<",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzqc;",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzpz;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/firebase-auth-api/zzod<",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzqc;",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzce;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzno;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/firebase-auth-api/zzno<",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzql;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 9
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqf;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzqf;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzqc;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzpz;

    .line 10
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzod;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzof;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    .line 11
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqi;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzqi;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzqc;

    const-class v2, Lcom/google/android/gms/internal/firebase-auth-api/zzce;

    .line 12
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzod;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzof;Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    .line 13
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzqh;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzno;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 14
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/internal/firebase-auth-api/zzoh;

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzqk;

    const-class v3, Lcom/google/android/gms/internal/firebase-auth-api/zzce;

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzqk;-><init>(Ljava/lang/Class;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zznb;-><init>(Ljava/lang/Class;[Lcom/google/android/gms/internal/firebase-auth-api/zzoh;)V

    return-void
.end method

.method public static zza()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzuc;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;->zza()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzxo;->zza(II)V

    .line 95
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zzb()I

    move-result v0

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzuh;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzuh;)V

    return-void

    .line 96
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "key too short"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzuh;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzuh;)V

    return-void
.end method

.method public static zza(Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 16
    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;-><init>()V

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzct;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zznb;Z)V

    .line 17
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzre;->zza()V

    .line 18
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zznr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zznr;

    move-result-object p0

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    .line 19
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zznr;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzod;)V

    .line 20
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zznr;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zznr;

    move-result-object p0

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzod;

    .line 21
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zznr;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzod;)V

    .line 22
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzns;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzns;

    move-result-object p0

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    const-string v2, "HMAC_SHA256_128BITTAG"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    const/16 v2, 0x20

    .line 27
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    const/16 v3, 0x10

    .line 28
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 29
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 30
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v4, "HMAC_SHA256_128BITTAG_RAW"

    .line 32
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 35
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 36
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 37
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 38
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v4, "HMAC_SHA256_256BITTAG"

    .line 40
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 43
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 44
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 45
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v4, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 46
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v4, "HMAC_SHA256_256BITTAG_RAW"

    .line 48
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    const/16 v4, 0x40

    .line 51
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 52
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 53
    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 54
    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v5, "HMAC_SHA512_128BITTAG"

    .line 56
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 59
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 60
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 61
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 62
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v3, "HMAC_SHA512_128BITTAG_RAW"

    .line 64
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 67
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 68
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 69
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 70
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v3, "HMAC_SHA512_256BITTAG"

    .line 72
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 75
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 76
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 77
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 78
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 79
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v2, "HMAC_SHA512_256BITTAG_RAW"

    .line 80
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzqx;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    const-string v2, "HMAC_SHA512_512BITTAG"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzql;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 84
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 85
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;

    .line 86
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzb;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;

    .line 87
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzql$zzc;)Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;

    move-result-object v1

    .line 88
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzql$zza;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    move-result-object v1

    const-string v2, "HMAC_SHA512_512BITTAG_RAW"

    .line 89
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzns;->zza(Ljava/util/Map;)V

    .line 92
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zznl;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zznl;

    move-result-object p0

    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzno;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzql;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zznl;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzno;Ljava/lang/Class;)V

    return-void
.end method

.method private static zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzuh;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 100
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result v0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_a

    .line 102
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqm;->zza:[I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzub;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzub;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const-string v2, "tag size too big"

    if-eq v0, v1, :cond_8

    const/4 v1, 0x2

    if-eq v0, v1, :cond_6

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 111
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result p0

    const/16 v0, 0x40

    if-gt p0, v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-direct {p0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 113
    :cond_1
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "unknown hash type"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 109
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result p0

    const/16 v0, 0x30

    if-gt p0, v0, :cond_3

    goto :goto_0

    .line 110
    :cond_3
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-direct {p0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 107
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result p0

    const/16 v0, 0x20

    if-gt p0, v0, :cond_5

    goto :goto_0

    .line 108
    :cond_5
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-direct {p0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 105
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result p0

    const/16 v0, 0x1c

    if-gt p0, v0, :cond_7

    goto :goto_0

    .line 106
    :cond_7
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-direct {p0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 103
    :cond_8
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuh;->zza()I

    move-result p0

    const/16 v0, 0x14

    if-gt p0, v0, :cond_9

    :goto_0
    return-void

    .line 104
    :cond_9
    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-direct {p0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 101
    :cond_a
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "tag size too small"

    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzakn;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzaji;
        }
    .end annotation

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzaio;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzaio;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Lcom/google/android/gms/internal/firebase-auth-api/zzaio;)Lcom/google/android/gms/internal/firebase-auth-api/zzuc;

    move-result-object p1

    return-object p1
.end method

.method public final bridge synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 99
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzuc;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqg;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzuc;)V

    return-void
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;
    .locals 1

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;

    return-object v0
.end method

.method public final zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzne;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzne<",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzug;",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzuc;",
            ">;"
        }
    .end annotation

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;

    const-class v1, Lcom/google/android/gms/internal/firebase-auth-api/zzug;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzqj;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqg;Ljava/lang/Class;)V

    return-object v0
.end method

.method public final zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzuy$zza;
    .locals 1

    .line 4
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzuy$zza;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzuy$zza;

    return-object v0
.end method

.method public final zze()Ljava/lang/String;
    .locals 1

    const-string v0, "type.googleapis.com/google.crypto.tink.HmacKey"

    return-object v0
.end method
