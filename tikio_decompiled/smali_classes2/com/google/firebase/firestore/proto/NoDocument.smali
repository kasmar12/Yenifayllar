.class public final Lcom/google/firebase/firestore/proto/NoDocument;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "NoDocument.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/NoDocumentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/NoDocument$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/NoDocument;",
        "Lcom/google/firebase/firestore/proto/NoDocument$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/NoDocumentOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

.field public static final NAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/NoDocument;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_TIME_FIELD_NUMBER:I = 0x2


# instance fields
.field private name_:Ljava/lang/String;

.field private readTime_:Lcom/google/protobuf/Timestamp;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 460
    new-instance v0, Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/NoDocument;-><init>()V

    .line 463
    sput-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    .line 464
    const-class v1, Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    .line 19
    iput-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1

    .line 13
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/NoDocument;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->setName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/NoDocument;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/NoDocument;->clearName()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/NoDocument;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/NoDocument;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->setReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/proto/NoDocument;Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->mergeReadTime(Lcom/google/protobuf/Timestamp;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/proto/NoDocument;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/NoDocument;->clearReadTime()V

    return-void
.end method

.method private clearName()V
    .locals 1

    .line 75
    invoke-static {}, Lcom/google/firebase/firestore/proto/NoDocument;->getDefaultInstance()Lcom/google/firebase/firestore/proto/NoDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/NoDocument;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private clearReadTime()V
    .locals 1

    const/4 v0, 0x0

    .line 155
    iput-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1

    .line 469
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    return-object v0
.end method

.method private mergeReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 2

    .line 138
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    .line 140
    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 141
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    .line 142
    invoke-static {v0}, Lcom/google/protobuf/Timestamp;->newBuilder(Lcom/google/protobuf/Timestamp;)Lcom/google/protobuf/Timestamp$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/Timestamp$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp$Builder;

    invoke-virtual {p1}, Lcom/google/protobuf/Timestamp$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/protobuf/Timestamp;

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    goto :goto_0

    .line 144
    :cond_0
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/NoDocument$Builder;
    .locals 1

    .line 234
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/NoDocument;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/NoDocument$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/NoDocument;)Lcom/google/firebase/firestore/proto/NoDocument$Builder;
    .locals 1

    .line 237
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/NoDocument;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/NoDocument;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 175
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 182
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 162
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 169
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 187
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/NoDocument;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 194
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/NoDocument;",
            ">;"
        }
    .end annotation

    .line 475
    sget-object v0, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/NoDocument;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 88
    invoke-static {p1}, Lcom/google/firebase/firestore/proto/NoDocument;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 89
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    return-void
.end method

.method private setReadTime(Lcom/google/protobuf/Timestamp;)V
    .locals 0

    .line 125
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 410
    sget-object p2, Lcom/google/firebase/firestore/proto/NoDocument$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 453
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 447
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 432
    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/NoDocument;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    .line 434
    const-class p2, Lcom/google/firebase/firestore/proto/NoDocument;

    monitor-enter p2

    .line 435
    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/NoDocument;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 437
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 440
    sput-object p1, Lcom/google/firebase/firestore/proto/NoDocument;->PARSER:Lcom/google/protobuf/Parser;

    .line 442
    :cond_0
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-object p1

    .line 429
    :pswitch_3
    sget-object p1, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "name_"

    aput-object v0, p1, p3

    const-string p3, "readTime_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0208\u0002\t"

    .line 425
    sget-object p3, Lcom/google/firebase/firestore/proto/NoDocument;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/NoDocument;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 415
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/NoDocument$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/NoDocument$Builder;-><init>(Lcom/google/firebase/firestore/proto/NoDocument$1;)V

    return-object p1

    .line 412
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/NoDocument;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/NoDocument;-><init>()V

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    return-object v0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->name_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getReadTime()Lcom/google/protobuf/Timestamp;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/protobuf/Timestamp;->getDefaultInstance()Lcom/google/protobuf/Timestamp;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public hasReadTime()Z
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/NoDocument;->readTime_:Lcom/google/protobuf/Timestamp;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
