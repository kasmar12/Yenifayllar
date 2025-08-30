.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzwh;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzbp;


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;

.field private static final zzb:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzc:[B

.field private static final zzd:[B


# instance fields
.field private final zze:Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

.field private final zzf:[B

.field private final zzg:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Integer;

    const/16 v1, 0x40

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzb:Ljava/util/Collection;

    const/16 v0, 0x10

    new-array v1, v0, [B

    .line 3
    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzc:[B

    new-array v0, v0, [B

    .line 4
    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzd:[B

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzxt;->zza([B)Lcom/google/android/gms/internal/firebase-auth-api/zzxt;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;-><init>([BLcom/google/android/gms/internal/firebase-auth-api/zzxt;)V

    return-void
.end method

.method private constructor <init>([BLcom/google/android/gms/internal/firebase-auth-api/zzxt;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzif$zza;->zza()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 10
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzb:Ljava/util/Collection;

    array-length v1, p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 12
    array-length v1, p1

    div-int/lit8 v1, v1, 0x2

    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 13
    array-length v1, p1

    div-int/lit8 v1, v1, 0x2

    array-length v2, p1

    invoke-static {p1, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzf:[B

    .line 14
    new-instance p1, Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzxl;-><init>([B)V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

    .line 15
    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzxt;->zzb()[B

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzg:[B

    return-void

    .line 11
    :cond_0
    new-instance p2, Ljava/security/InvalidKeyException;

    array-length p1, p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "invalid key size: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes; key must have 64 bytes"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 9
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Can not use AES-SIV in FIPS-mode."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final zza([B[B)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 17
    array-length v0, p1

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzg:[B

    array-length v2, v1

    const/16 v3, 0x10

    add-int/2addr v2, v3

    if-lt v0, v2, :cond_8

    .line 19
    invoke-static {v1, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzpf;->zza([B[B)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 21
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwt;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwt;

    const-string v1, "AES/CTR/NoPadding"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzwt;->zza(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/crypto/Cipher;

    .line 22
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzg:[B

    array-length v2, v1

    array-length v1, v1

    add-int/2addr v1, v3

    .line 23
    invoke-static {p1, v2, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    .line 24
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    const/16 v4, 0x8

    .line 25
    aget-byte v5, v2, v4

    and-int/lit8 v5, v5, 0x7f

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    const/16 v4, 0xc

    .line 26
    aget-byte v5, v2, v4

    and-int/lit8 v5, v5, 0x7f

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 27
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzf:[B

    const-string v6, "AES"

    invoke-direct {v4, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v5, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v5, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v4, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 28
    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzg:[B

    array-length v4, v4

    add-int/2addr v4, v3

    array-length v5, p1

    .line 29
    invoke-static {p1, v4, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 31
    array-length p1, p1

    const/4 v4, 0x0

    if-nez p1, :cond_0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzxp;->zza()Z

    move-result p1

    if-eqz p1, :cond_0

    new-array v0, v4, [B

    :cond_0
    new-array p1, v2, [[B

    aput-object p2, p1, v4

    const/4 p2, 0x1

    aput-object v0, p1, p2

    .line 34
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zzc:[B

    invoke-virtual {v2, v5, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzxl;->zza([BI)[B

    move-result-object v2

    const/4 v5, 0x0

    :goto_0
    if-gtz v5, :cond_2

    .line 36
    aget-object v6, p1, v5

    if-nez v6, :cond_1

    new-array v6, v4, [B

    goto :goto_1

    .line 38
    :cond_1
    aget-object v6, p1, v5

    .line 40
    :goto_1
    invoke-static {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb([B)[B

    move-result-object v2

    iget-object v7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

    invoke-virtual {v7, v6, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzxl;->zza([BI)[B

    move-result-object v6

    .line 41
    invoke-static {v2, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzwg;->zza([B[B)[B

    move-result-object v2

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 43
    :cond_2
    aget-object p1, p1, p2

    .line 44
    array-length p2, p1

    if-lt p2, v3, :cond_4

    .line 46
    array-length p2, p1

    array-length v5, v2

    if-lt p2, v5, :cond_3

    .line 48
    array-length p2, p1

    array-length v5, v2

    sub-int/2addr p2, v5

    .line 49
    array-length v5, p1

    invoke-static {p1, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    .line 50
    :goto_2
    array-length v5, v2

    if-ge v4, v5, :cond_5

    add-int v5, p2, v4

    .line 51
    aget-byte v6, p1, v5

    aget-byte v7, v2, v4

    xor-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, p1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 47
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "xorEnd requires a.length >= b.length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_4
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zza([B)[B

    move-result-object p1

    invoke-static {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzrd;->zzb([B)[B

    move-result-object p2

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzwg;->zza([B[B)[B

    move-result-object p1

    .line 57
    :cond_5
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzwh;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzxl;

    invoke-virtual {p2, p1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzxl;->zza([BI)[B

    move-result-object p1

    .line 60
    invoke-static {v1, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p1

    if-eqz p1, :cond_6

    return-object v0

    .line 63
    :cond_6
    new-instance p1, Ljavax/crypto/AEADBadTagException;

    const-string p2, "Integrity check failed."

    invoke-direct {p1, p2}, Ljavax/crypto/AEADBadTagException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 20
    :cond_7
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_8
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Ciphertext too short."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
