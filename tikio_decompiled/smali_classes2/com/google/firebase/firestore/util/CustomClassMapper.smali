.class public Lcom/google/firebase/firestore/util/CustomClassMapper;
.super Ljava/lang/Object;
.source "CustomClassMapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;,
        Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;,
        Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;
    }
.end annotation


# static fields
.field private static final MAX_DEPTH:I = 0x1f4

.field private static final mappers:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/util/CustomClassMapper;->mappers:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 0

    .line 57
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 0

    .line 57
    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;
    .locals 0

    .line 57
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(ZLjava/lang/String;)V
    .locals 0

    .line 57
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->hardAssert(ZLjava/lang/String;)V

    return-void
.end method

.method private static convertBean(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    .line 542
    invoke-static {p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->loadOrCreateBeanMapperForClass(Ljava/lang/Class;)Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;

    move-result-object v0

    .line 543
    instance-of v1, p0, Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 544
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->expectMap(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->deserialize(Ljava/util/Map;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 546
    :cond_0
    iget-object p2, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Can\'t convert object of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to type "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 546
    invoke-static {p2, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertBlob(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/Blob;
    .locals 2

    .line 512
    instance-of v0, p0, Lcom/google/firebase/firestore/Blob;

    if-eqz v0, :cond_0

    .line 513
    check-cast p0, Lcom/google/firebase/firestore/Blob;

    return-object p0

    .line 515
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to Blob"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 515
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertBoolean(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Boolean;
    .locals 2

    .line 468
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 469
    check-cast p0, Ljava/lang/Boolean;

    return-object p0

    .line 471
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to boolean"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 471
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertDate(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Date;
    .locals 2

    .line 488
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 489
    check-cast p0, Ljava/util/Date;

    return-object p0

    .line 490
    :cond_0
    instance-of v0, p0, Lcom/google/firebase/Timestamp;

    if-eqz v0, :cond_1

    .line 491
    check-cast p0, Lcom/google/firebase/Timestamp;

    invoke-virtual {p0}, Lcom/google/firebase/Timestamp;->toDate()Ljava/util/Date;

    move-result-object p0

    return-object p0

    .line 493
    :cond_1
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to Date"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 493
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertDocumentReference(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/DocumentReference;
    .locals 2

    .line 532
    instance-of v0, p0, Lcom/google/firebase/firestore/DocumentReference;

    if-eqz v0, :cond_0

    .line 533
    check-cast p0, Lcom/google/firebase/firestore/DocumentReference;

    return-object p0

    .line 535
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to DocumentReference"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 535
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertDouble(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Double;
    .locals 6

    .line 443
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 444
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->doubleValue()D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    .line 445
    :cond_0
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_2

    .line 446
    move-object v0, p0

    check-cast v0, Ljava/lang/Long;

    .line 447
    invoke-virtual {v0}, Ljava/lang/Long;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 448
    invoke-virtual {v1}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    return-object v1

    .line 451
    :cond_1
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Loss of precision while converting number to double: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ". Did you mean to use a 64-bit long instead?"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 458
    :cond_2
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_3

    .line 459
    check-cast p0, Ljava/lang/Double;

    return-object p0

    .line 461
    :cond_3
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert a value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 463
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to double"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 461
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertGeoPoint(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/GeoPoint;
    .locals 2

    .line 522
    instance-of v0, p0, Lcom/google/firebase/firestore/GeoPoint;

    if-eqz v0, :cond_0

    .line 523
    check-cast p0, Lcom/google/firebase/firestore/GeoPoint;

    return-object p0

    .line 525
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to GeoPoint"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 525
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertInteger(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Integer;
    .locals 5

    .line 399
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 400
    check-cast p0, Ljava/lang/Integer;

    return-object p0

    .line 401
    :cond_0
    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_1

    goto :goto_0

    .line 413
    :cond_1
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert a value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to int"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 413
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 402
    :cond_2
    :goto_0
    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    const-wide/high16 v2, -0x3e20000000000000L    # -2.147483648E9

    cmpl-double v4, v0, v2

    if-ltz v4, :cond_3

    const-wide v2, 0x41dfffffffc00000L    # 2.147483647E9

    cmpg-double v4, v0, v2

    if-gtz v4, :cond_3

    .line 404
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 406
    :cond_3
    iget-object p0, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Numeric value out of 32-bit integer range: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ". Did you mean to use a long or double instead of an int?"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertLong(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Long;
    .locals 5

    .line 420
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 421
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->longValue()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 422
    :cond_0
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 423
    check-cast p0, Ljava/lang/Long;

    return-object p0

    .line 424
    :cond_1
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_3

    .line 425
    check-cast p0, Ljava/lang/Double;

    .line 426
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/high16 v2, -0x3c20000000000000L    # -9.223372036854776E18

    cmpl-double v4, v0, v2

    if-ltz v4, :cond_2

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/high16 v2, 0x43e0000000000000L    # 9.223372036854776E18

    cmpg-double v4, v0, v2

    if-gtz v4, :cond_2

    .line 427
    invoke-virtual {p0}, Ljava/lang/Double;->longValue()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 429
    :cond_2
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Numeric value out of 64-bit long range: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ". Did you mean to use a double instead of a long?"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 436
    :cond_3
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert a value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to long"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 436
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertString(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/String;
    .locals 2

    .line 478
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 479
    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 481
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to String"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 481
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static convertTimestamp(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/Timestamp;
    .locals 2

    .line 500
    instance-of v0, p0, Lcom/google/firebase/Timestamp;

    if-eqz v0, :cond_0

    .line 501
    check-cast p0, Lcom/google/firebase/Timestamp;

    return-object p0

    .line 502
    :cond_0
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_1

    .line 503
    new-instance p1, Lcom/google/firebase/Timestamp;

    check-cast p0, Ljava/util/Date;

    invoke-direct {p1, p0}, Lcom/google/firebase/Timestamp;-><init>(Ljava/util/Date;)V

    return-object p1

    .line 505
    :cond_1
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to Timestamp"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 505
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static convertToCustomClass(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/DocumentReference;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/firebase/firestore/DocumentReference;",
            ")TT;"
        }
    .end annotation

    .line 103
    new-instance v0, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;

    sget-object v1, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->EMPTY:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    invoke-direct {v0, v1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;-><init>(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Lcom/google/firebase/firestore/DocumentReference;)V

    invoke-static {p0, p1, v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToClass(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static convertToPlainJavaTypes(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 81
    invoke-static {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static convertToPlainJavaTypes(Ljava/util/Map;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "*",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 85
    invoke-static {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 86
    instance-of v0, p0, Ljava/util/Map;

    invoke-static {v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->hardAssert(Z)V

    .line 88
    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method private static deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2

    .line 561
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not deserialize object. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 562
    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->getLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 563
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " (found in field \'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\')"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 565
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-object p0
.end method

.method private static deserializeToClass(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 227
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_c

    const-class v0, Ljava/lang/Number;

    .line 228
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_c

    const-class v0, Ljava/lang/Boolean;

    .line 229
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_c

    const-class v0, Ljava/lang/Character;

    .line 230
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_0

    .line 232
    :cond_1
    const-class v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 233
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertString(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 234
    :cond_2
    const-class v0, Ljava/util/Date;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 235
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertDate(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Date;

    move-result-object p0

    return-object p0

    .line 236
    :cond_3
    const-class v0, Lcom/google/firebase/Timestamp;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 237
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertTimestamp(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/Timestamp;

    move-result-object p0

    return-object p0

    .line 238
    :cond_4
    const-class v0, Lcom/google/firebase/firestore/Blob;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 239
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertBlob(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/Blob;

    move-result-object p0

    return-object p0

    .line 240
    :cond_5
    const-class v0, Lcom/google/firebase/firestore/GeoPoint;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 241
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertGeoPoint(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/GeoPoint;

    move-result-object p0

    return-object p0

    .line 242
    :cond_6
    const-class v0, Lcom/google/firebase/firestore/DocumentReference;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 243
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertDocumentReference(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    return-object p0

    .line 244
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_b

    .line 247
    invoke-virtual {p1}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v0

    array-length v0, v0

    if-gtz v0, :cond_a

    .line 250
    const-class v0, Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    return-object p0

    .line 252
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 253
    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToEnum(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 255
    :cond_9
    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertBean(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 248
    :cond_a
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Class "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " has generic type parameters"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 248
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 245
    :cond_b
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    const-string p1, "Converting to Arrays is not supported, please use Lists instead"

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 231
    :cond_c
    :goto_0
    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToPrimitive(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static deserializeToEnum(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    .line 341
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 342
    check-cast p0, Ljava/lang/String;

    .line 347
    invoke-virtual {p1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 348
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 349
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->isEnumConstant()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 350
    invoke-static {v3}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->access$000(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v4

    .line 351
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 352
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 359
    :cond_1
    :goto_1
    :try_start_0
    invoke-static {p1, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 361
    :catch_0
    iget-object p2, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find enum value of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " for value \""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\""

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 361
    invoke-static {p2, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 366
    :cond_2
    iget-object p2, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Expected a String while deserializing to enum "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " but got a "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 366
    invoke-static {p2, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static deserializeToParameterizedType(Ljava/lang/Object;Ljava/lang/reflect/ParameterizedType;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/ParameterizedType;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    .line 263
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 264
    const-class v1, Ljava/util/List;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 265
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p1

    aget-object p1, p1, v2

    .line 266
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 267
    check-cast p0, Ljava/util/List;

    .line 268
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 269
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_0

    .line 272
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v3, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 274
    invoke-virtual {v3, v4}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->child(Ljava/lang/String;)Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->newInstanceWithErrorPath(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;

    move-result-object v3

    .line 271
    invoke-static {v1, p1, v3}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object v1

    .line 270
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    .line 278
    :cond_1
    iget-object p1, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Expected a List, but got a "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 280
    :cond_2
    const-class v1, Ljava/util/Map;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 281
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    aget-object v0, v0, v2

    .line 282
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p1

    const/4 v1, 0x1

    aget-object p1, p1, v1

    .line 283
    const-class v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 288
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->expectMap(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Map;

    move-result-object p0

    .line 289
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 290
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 292
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 294
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    .line 296
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->child(Ljava/lang/String;)Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->newInstanceWithErrorPath(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;

    move-result-object v1

    .line 293
    invoke-static {v3, p1, v1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object v1

    .line 291
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    return-object v0

    .line 284
    :cond_4
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Only Maps with string keys are supported, but found Map with key type "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 299
    :cond_5
    const-class v1, Ljava/util/Collection;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 303
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->expectMap(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Map;

    move-result-object p0

    .line 304
    invoke-static {v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->loadOrCreateBeanMapperForClass(Ljava/lang/Class;)Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;

    move-result-object v0

    .line 305
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 306
    invoke-static {v0}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->access$100(Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v3

    .line 307
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p1

    .line 308
    array-length v4, p1

    array-length v5, v3

    if-ne v4, v5, :cond_7

    .line 311
    :goto_2
    array-length v4, v3

    if-ge v2, v4, :cond_6

    .line 312
    aget-object v4, v3, v2

    aget-object v5, p1, v2

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 314
    :cond_6
    invoke-virtual {v0, p0, v1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->deserialize(Ljava/util/Map;Ljava/util/Map;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 309
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Mismatched lengths for type variables and actual types"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 300
    :cond_8
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    const-string p1, "Collections are not supported, please use Lists instead"

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static deserializeToPrimitive(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    .line 321
    const-class v0, Ljava/lang/Integer;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 323
    :cond_0
    const-class v0, Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_8

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_3

    .line 325
    :cond_1
    const-class v0, Ljava/lang/Double;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_7

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 327
    :cond_2
    const-class v0, Ljava/lang/Long;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_6

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 329
    :cond_3
    const-class v0, Ljava/lang/Float;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    .line 332
    :cond_4
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 334
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v0

    const-string p1, "Deserializing values to %s is not supported"

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 332
    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 330
    :cond_5
    :goto_0
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertDouble(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    .line 328
    :cond_6
    :goto_1
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertLong(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 326
    :cond_7
    :goto_2
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertDouble(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    .line 324
    :cond_8
    :goto_3
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertBoolean(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 322
    :cond_9
    :goto_4
    invoke-static {p0, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->convertInteger(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private static deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")TT;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 191
    :cond_0
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_1

    .line 192
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToParameterizedType(Ljava/lang/Object;Ljava/lang/reflect/ParameterizedType;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 193
    :cond_1
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_2

    .line 194
    check-cast p1, Ljava/lang/Class;

    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToClass(Ljava/lang/Object;Ljava/lang/Class;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 195
    :cond_2
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    .line 196
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 197
    array-length v3, v3

    if-gtz v3, :cond_4

    .line 206
    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 207
    array-length v3, v0

    if-lez v3, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected type bounds on wildcard "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->hardAssert(ZLjava/lang/String;)V

    .line 208
    aget-object p1, v0, v2

    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 198
    :cond_4
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    const-string p1, "Generic lower-bounded wildcard types are not supported"

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 209
    :cond_5
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_7

    .line 211
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/TypeVariable;

    invoke-interface {v0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 212
    array-length v3, v0

    if-lez v3, :cond_6

    goto :goto_1

    :cond_6
    const/4 v1, 0x0

    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected type bounds on type variable "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->hardAssert(ZLjava/lang/String;)V

    .line 213
    aget-object p1, v0, v2

    invoke-static {p0, p1, p2}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeToType(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 215
    :cond_7
    instance-of p0, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz p0, :cond_8

    .line 216
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    const-string p1, "Generic Arrays are not supported, please use Lists instead"

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0

    .line 219
    :cond_8
    iget-object p0, p2, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unknown type encountered: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static expectMap(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 389
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 391
    check-cast p0, Ljava/util/Map;

    return-object p0

    .line 393
    :cond_0
    iget-object p1, p1, Lcom/google/firebase/firestore/util/CustomClassMapper$DeserializeContext;->errorPath:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Expected a Map while deserializing, but got a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 393
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->deserializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static hardAssert(Z)V
    .locals 1

    const-string v0, "Internal inconsistency"

    .line 64
    invoke-static {p0, v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->hardAssert(ZLjava/lang/String;)V

    return-void
.end method

.method private static hardAssert(ZLjava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_0

    return-void

    .line 69
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Hard assert failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static loadOrCreateBeanMapperForClass(Ljava/lang/Class;)Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper<",
            "TT;>;"
        }
    .end annotation

    .line 377
    sget-object v0, Lcom/google/firebase/firestore/util/CustomClassMapper;->mappers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;

    if-nez v1, :cond_0

    .line 379
    new-instance v1, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;

    invoke-direct {v1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;-><init>(Ljava/lang/Class;)V

    .line 382
    invoke-interface {v0, p0, v1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v1
.end method

.method private static serialize(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 107
    sget-object v0, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->EMPTY:Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    invoke-static {p0, v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 112
    invoke-virtual {p1}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->getLength()I

    move-result v0

    const/16 v1, 0x1f4

    if-gt v0, v1, :cond_13

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 121
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 122
    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Double;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 129
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v1

    const-string p0, "Numbers of type %s are not supported, please use an int, long, float or double"

    .line 127
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 125
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    :goto_0
    return-object p0

    .line 131
    :cond_3
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_4

    return-object p0

    .line 133
    :cond_4
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    return-object p0

    .line 135
    :cond_5
    instance-of v0, p0, Ljava/lang/Character;

    if-nez v0, :cond_12

    .line 137
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_8

    .line 138
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 139
    check-cast p0, Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 140
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 141
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 142
    check-cast v2, Ljava/lang/String;

    .line 143
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v2}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->child(Ljava/lang/String;)Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_6
    const-string p0, "Maps with non-string keys are not supported"

    .line 145
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_7
    return-object v0

    .line 149
    :cond_8
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_b

    .line 150
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_a

    .line 151
    check-cast p0, Ljava/util/List;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    :goto_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_9

    .line 154
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->child(Ljava/lang/String;)Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_9
    return-object v0

    :cond_a
    const-string p0, "Serializing Collections is not supported, please use Lists instead"

    .line 158
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    .line 161
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_11

    .line 163
    instance-of v0, p0, Ljava/lang/Enum;

    if-eqz v0, :cond_c

    .line 164
    move-object p1, p0

    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    .line 166
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 167
    invoke-static {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->access$000(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object p1

    .line 171
    :cond_c
    instance-of v0, p0, Ljava/util/Date;

    if-nez v0, :cond_10

    instance-of v0, p0, Lcom/google/firebase/Timestamp;

    if-nez v0, :cond_10

    instance-of v0, p0, Lcom/google/firebase/firestore/GeoPoint;

    if-nez v0, :cond_10

    instance-of v0, p0, Lcom/google/firebase/firestore/Blob;

    if-nez v0, :cond_10

    instance-of v0, p0, Lcom/google/firebase/firestore/DocumentReference;

    if-nez v0, :cond_10

    instance-of v0, p0, Lcom/google/firebase/firestore/FieldValue;

    if-eqz v0, :cond_d

    goto :goto_4

    .line 178
    :cond_d
    instance-of v0, p0, Landroid/net/Uri;

    if-nez v0, :cond_f

    instance-of v0, p0, Ljava/net/URI;

    if-nez v0, :cond_f

    instance-of v0, p0, Ljava/net/URL;

    if-eqz v0, :cond_e

    goto :goto_3

    .line 181
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 182
    invoke-static {v0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->loadOrCreateBeanMapperForClass(Ljava/lang/Class;)Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;

    move-result-object v0

    .line 183
    invoke-virtual {v0, p0, p1}, Lcom/google/firebase/firestore/util/CustomClassMapper$BeanMapper;->serialize(Ljava/lang/Object;Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 179
    :cond_f
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_10
    :goto_4
    return-object p0

    :cond_11
    const-string p0, "Serializing Arrays is not supported, please use Lists instead"

    .line 162
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_12
    const-string p0, "Characters are not supported, please use Strings"

    .line 136
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_13
    const-string p0, "Exceeded maximum depth of 500, which likely indicates there\'s an object cycle"

    .line 113
    invoke-static {p1, p0}, Lcom/google/firebase/firestore/util/CustomClassMapper;->serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static serializeError(Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .locals 2

    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not serialize object. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 554
    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->getLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " (found in field \'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/util/CustomClassMapper$ErrorPath;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\')"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 557
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object p0
.end method
