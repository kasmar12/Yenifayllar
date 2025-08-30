.class final Lcom/google/android/gms/internal/firebase-auth-api/zzlp;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzne;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/firebase-auth-api/zzne<",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzuq;",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzuu;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzln;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzln;Ljava/lang/Class;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzlp;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzln;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzne;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzakn;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/firebase-auth-api/zzaji;
        }
    .end annotation

    .line 71
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzaio;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzaio;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;Lcom/google/android/gms/internal/firebase-auth-api/zzaio;)Lcom/google/android/gms/internal/firebase-auth-api/zzuq;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zza(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)Lcom/google/android/gms/internal/firebase-auth-api/zzakn;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzur;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzur;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzuo;

    move-result-object v0

    .line 3
    sget-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzlo;->zza:[I

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuo;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v1, v2, :cond_8

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    if-eq v1, v6, :cond_1

    if-eq v1, v5, :cond_1

    if-ne v1, v4, :cond_0

    goto :goto_0

    .line 58
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string v0, "Invalid KEM"

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 15
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzur;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzur;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzuo;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlt;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzuo;)Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwp;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzwo;)Ljava/security/spec/ECParameterSpec;

    move-result-object v7

    .line 18
    sget-object v8, Lcom/google/android/gms/internal/firebase-auth-api/zzwt;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzwt;

    const-string v9, "EC"

    invoke-virtual {v8, v9}, Lcom/google/android/gms/internal/firebase-auth-api/zzwt;->zza(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/security/KeyPairGenerator;

    .line 19
    invoke-virtual {v8, v7}, Ljava/security/KeyPairGenerator;->initialize(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 20
    invoke-virtual {v8}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    move-result-object v7

    .line 22
    sget-object v8, Lcom/google/android/gms/internal/firebase-auth-api/zzwr;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwr;

    .line 23
    invoke-virtual {v7}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v9

    check-cast v9, Ljava/security/interfaces/ECPublicKey;

    invoke-interface {v9}, Ljava/security/interfaces/ECPublicKey;->getW()Ljava/security/spec/ECPoint;

    move-result-object v9

    .line 25
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwp;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzwo;)Ljava/security/spec/ECParameterSpec;

    move-result-object v1

    invoke-virtual {v1}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 26
    invoke-static {v9, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzmg;->zza(Ljava/security/spec/ECPoint;Ljava/security/spec/EllipticCurve;)V

    .line 27
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwp;->zza(Ljava/security/spec/EllipticCurve;)I

    move-result v1

    .line 28
    invoke-virtual {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzwr;->ordinal()I

    move-result v10

    if-eqz v10, :cond_7

    if-eq v10, v2, :cond_5

    if-ne v10, v6, :cond_4

    mul-int/lit8 v2, v1, 0x2

    .line 36
    new-array v4, v2, [B

    .line 37
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineX()Ljava/math/BigInteger;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;)[B

    move-result-object v5

    .line 38
    array-length v6, v5

    if-le v6, v1, :cond_2

    .line 39
    array-length v6, v5

    sub-int/2addr v6, v1

    array-length v8, v5

    invoke-static {v5, v6, v8}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v5

    .line 40
    :cond_2
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineY()Ljava/math/BigInteger;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;)[B

    move-result-object v6

    .line 41
    array-length v8, v6

    if-le v8, v1, :cond_3

    .line 42
    array-length v8, v6

    sub-int/2addr v8, v1

    array-length v9, v6

    invoke-static {v6, v8, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    .line 43
    :cond_3
    array-length v8, v6

    sub-int/2addr v2, v8

    array-length v8, v6

    invoke-static {v6, v3, v4, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    array-length v2, v5

    sub-int/2addr v1, v2

    array-length v2, v5

    invoke-static {v5, v3, v4, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    .line 51
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid format:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    add-int/2addr v1, v2

    .line 46
    new-array v4, v1, [B

    .line 47
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineX()Ljava/math/BigInteger;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;)[B

    move-result-object v2

    .line 48
    array-length v8, v2

    sub-int/2addr v1, v8

    array-length v8, v2

    invoke-static {v2, v3, v4, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineY()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_1

    :cond_6
    const/4 v5, 0x2

    :goto_1
    int-to-byte v1, v5

    aput-byte v1, v4, v3

    goto :goto_2

    :cond_7
    mul-int/lit8 v5, v1, 0x2

    add-int/2addr v5, v2

    .line 29
    new-array v6, v5, [B

    .line 30
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineX()Ljava/math/BigInteger;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;)[B

    move-result-object v8

    .line 31
    invoke-virtual {v9}, Ljava/security/spec/ECPoint;->getAffineY()Ljava/math/BigInteger;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;)[B

    move-result-object v9

    .line 32
    array-length v10, v9

    sub-int/2addr v5, v10

    array-length v10, v9

    invoke-static {v9, v3, v6, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v1, v2

    .line 33
    array-length v2, v8

    sub-int/2addr v1, v2

    array-length v2, v8

    invoke-static {v8, v3, v6, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    aput-byte v4, v6, v3

    move-object v4, v6

    .line 54
    :goto_2
    invoke-virtual {v7}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    check-cast v1, Ljava/security/interfaces/ECPrivateKey;

    invoke-interface {v1}, Ljava/security/interfaces/ECPrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v1

    .line 55
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzlt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzuo;)I

    move-result v0

    .line 56
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzme;->zza(Ljava/math/BigInteger;I)[B

    move-result-object v0

    goto :goto_3

    :cond_8
    const/16 v0, 0x20

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzou;->zza(I)[B

    move-result-object v0

    .line 7
    aget-byte v1, v0, v3

    or-int/lit8 v1, v1, 0x7

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    const/16 v1, 0x1f

    .line 8
    aget-byte v2, v0, v1

    and-int/lit8 v2, v2, 0x3f

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 9
    aget-byte v2, v0, v1

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 12
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzxr;->zza([B)[B

    move-result-object v4

    .line 59
    :goto_3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzuv;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;

    move-result-object v1

    .line 60
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;

    move-result-object v1

    .line 61
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzur;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzur;)Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;

    move-result-object p1

    .line 62
    invoke-static {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zza([B)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzuv$zza;

    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajc$zza;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzakn;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzajc;

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzuv;

    .line 64
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzuu;->zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;

    move-result-object v1

    .line 65
    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;

    move-result-object v1

    .line 66
    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzuv;)Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;

    move-result-object p1

    .line 67
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zza([B)Lcom/google/android/gms/internal/firebase-auth-api/zzahp;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)Lcom/google/android/gms/internal/firebase-auth-api/zzuu$zza;

    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajc$zza;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzakn;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzajc;

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzuu;

    return-object p1
.end method

.method public final synthetic zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 74
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;

    .line 75
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzuq;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzur;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzlt;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzur;)V

    return-void
.end method
