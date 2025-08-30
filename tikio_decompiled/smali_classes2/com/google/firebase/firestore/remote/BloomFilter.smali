.class public final Lcom/google/firebase/firestore/remote/BloomFilter;
.super Ljava/lang/Object;
.source "BloomFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;
    }
.end annotation


# instance fields
.field private final bitCount:I

.field private final bitmap:Lcom/google/protobuf/ByteString;

.field private final hashCount:I

.field private final md5HashMessageDigest:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>(Lcom/google/protobuf/ByteString;II)V
    .locals 3

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p2, :cond_5

    const/16 v0, 0x8

    if-ge p2, v0, :cond_5

    const-string v1, "Invalid hash count: "

    if-ltz p3, :cond_4

    .line 46
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v2

    if-lez v2, :cond_1

    if-eqz p3, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 50
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v1

    if-nez v1, :cond_3

    if-nez p2, :cond_2

    goto :goto_1

    .line 52
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Expected padding of 0 when bitmap length is 0, but got "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitmap:Lcom/google/protobuf/ByteString;

    .line 57
    iput p3, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->hashCount:I

    .line 58
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result p1

    mul-int/lit8 p1, p1, 0x8

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitCount:I

    .line 59
    invoke-static {}, Lcom/google/firebase/firestore/remote/BloomFilter;->createMd5HashMessageDigest()Ljava/security/MessageDigest;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->md5HashMessageDigest:Ljava/security/MessageDigest;

    return-void

    .line 44
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 41
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid padding: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static create(Lcom/google/protobuf/ByteString;II)Lcom/google/firebase/firestore/remote/BloomFilter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;
        }
    .end annotation

    if-ltz p1, :cond_5

    const/16 v0, 0x8

    if-ge p1, v0, :cond_5

    const-string v0, "Invalid hash count: "

    if-ltz p2, :cond_4

    .line 75
    invoke-virtual {p0}, Lcom/google/protobuf/ByteString;->size()I

    move-result v1

    if-lez v1, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    new-instance p0, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 79
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/google/protobuf/ByteString;->size()I

    move-result v0

    if-nez v0, :cond_3

    if-nez p1, :cond_2

    goto :goto_1

    .line 81
    :cond_2
    new-instance p0, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Expected padding of 0 when bitmap length is 0, but got "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 85
    :cond_3
    :goto_1
    new-instance v0, Lcom/google/firebase/firestore/remote/BloomFilter;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/firebase/firestore/remote/BloomFilter;-><init>(Lcom/google/protobuf/ByteString;II)V

    return-object v0

    .line 73
    :cond_4
    new-instance p0, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 70
    :cond_5
    new-instance p0, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid padding: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/BloomFilter$BloomFilterCreateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static createMd5HashMessageDigest()Ljava/security/MessageDigest;
    .locals 3

    :try_start_0
    const-string v0, "MD5"

    .line 141
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 143
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Missing MD5 MessageDigest provider: "

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getBitIndex(JJI)I
    .locals 2

    int-to-long v0, p5

    mul-long p3, p3, v0

    add-long/2addr p1, p3

    .line 165
    iget p3, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitCount:I

    int-to-long p3, p3

    invoke-static {p1, p2, p3, p4}, Lcom/google/firebase/firestore/remote/BloomFilter;->unsignedRemainder(JJ)J

    move-result-wide p1

    long-to-int p2, p1

    return p2
.end method

.method private static getLongLittleEndian([BI)J
    .locals 7

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x8

    if-ge v2, v3, :cond_0

    add-int v3, p1, v2

    .line 151
    aget-byte v3, p0, v3

    int-to-long v3, v3

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    mul-int/lit8 v5, v2, 0x8

    shl-long/2addr v3, v5

    or-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method private isBitSet(I)Z
    .locals 2

    .line 187
    iget-object v0, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitmap:Lcom/google/protobuf/ByteString;

    div-int/lit8 v1, p1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/protobuf/ByteString;->byteAt(I)B

    move-result v0

    .line 188
    rem-int/lit8 p1, p1, 0x8

    const/4 v1, 0x1

    shl-int p1, v1, p1

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private md5HashDigest(Ljava/lang/String;)[B
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->md5HashMessageDigest:Ljava/security/MessageDigest;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    return-object p1
.end method

.method private static unsignedRemainder(JJ)J
    .locals 3

    const/4 v0, 0x1

    ushr-long v1, p0, v0

    .line 179
    div-long/2addr v1, p2

    shl-long v0, v1, v0

    mul-long v0, v0, p2

    sub-long/2addr p0, v0

    cmp-long v0, p0, p2

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 p2, 0x0

    :goto_0
    sub-long/2addr p0, p2

    return-wide p0
.end method


# virtual methods
.method getBitCount()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitCount:I

    return v0
.end method

.method public mightContain(Ljava/lang/String;)Z
    .locals 13

    .line 110
    iget v0, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitCount:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 114
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/remote/BloomFilter;->md5HashDigest(Ljava/lang/String;)[B

    move-result-object p1

    .line 115
    array-length v0, p1

    const/16 v2, 0x10

    if-ne v0, v2, :cond_3

    .line 120
    invoke-static {p1, v1}, Lcom/google/firebase/firestore/remote/BloomFilter;->getLongLittleEndian([BI)J

    move-result-wide v9

    const/16 v0, 0x8

    .line 121
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/remote/BloomFilter;->getLongLittleEndian([BI)J

    move-result-wide v11

    const/4 p1, 0x0

    .line 123
    :goto_0
    iget v0, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->hashCount:I

    if-ge p1, v0, :cond_2

    move-object v3, p0

    move-wide v4, v9

    move-wide v6, v11

    move v8, p1

    .line 124
    invoke-direct/range {v3 .. v8}, Lcom/google/firebase/firestore/remote/BloomFilter;->getBitIndex(JJI)I

    move-result v0

    .line 125
    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/remote/BloomFilter;->isBitSet(I)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1

    .line 116
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid md5 hash array length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " (expected 16)"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BloomFilter{hashCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->hashCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", bitmap=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/BloomFilter;->bitmap:Lcom/google/protobuf/ByteString;

    .line 200
    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
