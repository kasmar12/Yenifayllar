.class public final Lcom/google/firebase/firestore/proto/MutationQueue;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "MutationQueue.java"

# interfaces
.implements Lcom/google/firebase/firestore/proto/MutationQueueOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/proto/MutationQueue$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firebase/firestore/proto/MutationQueue;",
        "Lcom/google/firebase/firestore/proto/MutationQueue$Builder;",
        ">;",
        "Lcom/google/firebase/firestore/proto/MutationQueueOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

.field public static final LAST_ACKNOWLEDGED_BATCH_ID_FIELD_NUMBER:I = 0x1

.field public static final LAST_STREAM_TOKEN_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/MutationQueue;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private lastAcknowledgedBatchId_:I

.field private lastStreamToken_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 372
    new-instance v0, Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-direct {v0}, Lcom/google/firebase/firestore/proto/MutationQueue;-><init>()V

    .line 375
    sput-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    .line 376
    const-class v1, Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 20
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastStreamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$000()Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1

    .line 14
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/proto/MutationQueue;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/MutationQueue;->setLastAcknowledgedBatchId(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/proto/MutationQueue;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/MutationQueue;->clearLastAcknowledgedBatchId()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/proto/MutationQueue;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/proto/MutationQueue;->setLastStreamToken(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/firebase/firestore/proto/MutationQueue;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/google/firebase/firestore/proto/MutationQueue;->clearLastStreamToken()V

    return-void
.end method

.method private clearLastAcknowledgedBatchId()V
    .locals 1

    const/4 v0, 0x0

    .line 66
    iput v0, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastAcknowledgedBatchId_:I

    return-void
.end method

.method private clearLastStreamToken()V
    .locals 1

    .line 114
    invoke-static {}, Lcom/google/firebase/firestore/proto/MutationQueue;->getDefaultInstance()Lcom/google/firebase/firestore/proto/MutationQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/MutationQueue;->getLastStreamToken()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastStreamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1

    .line 381
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/firebase/firestore/proto/MutationQueue$Builder;
    .locals 1

    .line 192
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/MutationQueue;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/proto/MutationQueue$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firebase/firestore/proto/MutationQueue;)Lcom/google/firebase/firestore/proto/MutationQueue$Builder;
    .locals 1

    .line 195
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/proto/MutationQueue;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/firebase/firestore/proto/MutationQueue;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/firebase/firestore/proto/MutationQueue;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 133
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 140
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 120
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 127
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 145
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firebase/firestore/proto/MutationQueue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 152
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firebase/firestore/proto/MutationQueue;",
            ">;"
        }
    .end annotation

    .line 387
    sget-object v0, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/proto/MutationQueue;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setLastAcknowledgedBatchId(I)V
    .locals 0

    .line 52
    iput p1, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastAcknowledgedBatchId_:I

    return-void
.end method

.method private setLastStreamToken(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 98
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    iput-object p1, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastStreamToken_:Lcom/google/protobuf/ByteString;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 322
    sget-object p2, Lcom/google/firebase/firestore/proto/MutationQueue$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 365
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 359
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 344
    :pswitch_2
    sget-object p1, Lcom/google/firebase/firestore/proto/MutationQueue;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    .line 346
    const-class p2, Lcom/google/firebase/firestore/proto/MutationQueue;

    monitor-enter p2

    .line 347
    :try_start_0
    sget-object p1, Lcom/google/firebase/firestore/proto/MutationQueue;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 349
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 352
    sput-object p1, Lcom/google/firebase/firestore/proto/MutationQueue;->PARSER:Lcom/google/protobuf/Parser;

    .line 354
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

    .line 341
    :pswitch_3
    sget-object p1, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "lastAcknowledgedBatchId_"

    aput-object v0, p1, p3

    const-string p3, "lastStreamToken_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0004\u0002\n"

    .line 337
    sget-object p3, Lcom/google/firebase/firestore/proto/MutationQueue;->DEFAULT_INSTANCE:Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-static {p3, p2, p1}, Lcom/google/firebase/firestore/proto/MutationQueue;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 327
    :pswitch_5
    new-instance p1, Lcom/google/firebase/firestore/proto/MutationQueue$Builder;

    invoke-direct {p1, p3}, Lcom/google/firebase/firestore/proto/MutationQueue$Builder;-><init>(Lcom/google/firebase/firestore/proto/MutationQueue$1;)V

    return-object p1

    .line 324
    :pswitch_6
    new-instance p1, Lcom/google/firebase/firestore/proto/MutationQueue;

    invoke-direct {p1}, Lcom/google/firebase/firestore/proto/MutationQueue;-><init>()V

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

.method public getLastAcknowledgedBatchId()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastAcknowledgedBatchId_:I

    return v0
.end method

.method public getLastStreamToken()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/google/firebase/firestore/proto/MutationQueue;->lastStreamToken_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method
