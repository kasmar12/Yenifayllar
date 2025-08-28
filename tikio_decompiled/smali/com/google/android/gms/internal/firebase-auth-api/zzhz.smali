.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzhz;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzhy;
.source "com.google.firebase:firebase-auth@@22.3.0"


# direct methods
.method public constructor <init>([BI)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhy;-><init>([BI)V

    return-void
.end method


# virtual methods
.method final zza()I
    .locals 1

    const/16 v0, 0x18

    return v0
.end method

.method public final bridge synthetic zza(Ljava/nio/ByteBuffer;[B[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 4
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzhy;->zza(Ljava/nio/ByteBuffer;[B[B)V

    return-void
.end method

.method public final bridge synthetic zza([BLjava/nio/ByteBuffer;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 5
    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhy;->zza([BLjava/nio/ByteBuffer;)[B

    move-result-object p1

    return-object p1
.end method

.method final zza([II)[I
    .locals 11

    .line 6
    array-length v0, p1

    const/4 v1, 0x1

    const/4 v2, 0x6

    const/4 v3, 0x5

    const/4 v4, 0x0

    if-ne v0, v2, :cond_0

    const/16 v0, 0x10

    new-array v5, v0, [I

    .line 11
    iget-object v6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzhz;->zza:[I

    new-array v0, v0, [I

    .line 13
    invoke-static {v0, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zza([I[I)V

    .line 14
    aget v6, p1, v4

    const/16 v7, 0xc

    aput v6, v0, v7

    .line 15
    aget v1, p1, v1

    const/16 v6, 0xd

    aput v1, v0, v6

    const/4 v1, 0x2

    .line 16
    aget v1, p1, v1

    const/16 v8, 0xe

    aput v1, v0, v8

    const/4 v1, 0x3

    .line 17
    aget v1, p1, v1

    const/16 v9, 0xf

    aput v1, v0, v9

    .line 18
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zza([I)V

    .line 19
    aget v1, v0, v7

    const/4 v10, 0x4

    aput v1, v0, v10

    .line 20
    aget v1, v0, v6

    aput v1, v0, v3

    .line 21
    aget v1, v0, v8

    aput v1, v0, v2

    const/4 v1, 0x7

    .line 22
    aget v2, v0, v9

    aput v2, v0, v1

    const/16 v1, 0x8

    .line 23
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    .line 24
    invoke-static {v5, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhu;->zza([I[I)V

    aput p2, v5, v7

    aput v4, v5, v6

    .line 27
    aget p2, p1, v10

    aput p2, v5, v8

    .line 28
    aget p1, p1, v3

    aput p1, v5, v9

    return-object v5

    .line 7
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-array v0, v1, [Ljava/lang/Object;

    array-length p1, p1

    shl-int/2addr p1, v3

    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v4

    const-string p1, "XChaCha20 uses 192-bit nonces, but got a %d-bit nonce"

    .line 9
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
