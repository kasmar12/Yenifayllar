.class public final Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "DatastoreTestTrace.java"

# interfaces
.implements Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTraceOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/apphosting/datastore/testing/DatastoreTestTrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TestTrace"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;",
        "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;",
        ">;",
        "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTraceOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACTION_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRACE_DESCRIPTION_FIELD_NUMBER:I = 0x3

.field public static final TRACE_ID_FIELD_NUMBER:I = 0x1


# instance fields
.field private action_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;",
            ">;"
        }
    .end annotation
.end field

.field private traceDescription_:Ljava/lang/String;

.field private traceId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 10660
    new-instance v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-direct {v0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;-><init>()V

    .line 10663
    sput-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    .line 10664
    const-class v1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 10113
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    .line 10114
    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    .line 10115
    invoke-static {}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 10116
    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$19700()Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1

    .line 10108
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object v0
.end method

.method static synthetic access$19800(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Ljava/lang/String;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->setTraceId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$19900(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;)V
    .locals 0

    .line 10108
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->clearTraceId()V

    return-void
.end method

.method static synthetic access$20000(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->setTraceIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method static synthetic access$20100(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1, p2}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->setAction(ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V

    return-void
.end method

.method static synthetic access$20200(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->addAction(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V

    return-void
.end method

.method static synthetic access$20300(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1, p2}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->addAction(ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V

    return-void
.end method

.method static synthetic access$20400(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Ljava/lang/Iterable;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->addAllAction(Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$20500(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;)V
    .locals 0

    .line 10108
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->clearAction()V

    return-void
.end method

.method static synthetic access$20600(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;I)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->removeAction(I)V

    return-void
.end method

.method static synthetic access$20700(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Ljava/lang/String;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->setTraceDescription(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$20800(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;)V
    .locals 0

    .line 10108
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->clearTraceDescription()V

    return-void
.end method

.method static synthetic access$20900(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 10108
    invoke-direct {p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->setTraceDescriptionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAction(ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 1

    .line 10232
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10233
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->ensureActionIsMutable()V

    .line 10234
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addAction(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 1

    .line 10223
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10224
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->ensureActionIsMutable()V

    .line 10225
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addAllAction(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;",
            ">;)V"
        }
    .end annotation

    .line 10241
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->ensureActionIsMutable()V

    .line 10242
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-static {p1, v0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method private clearAction()V
    .locals 1

    .line 10249
    invoke-static {}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->emptyProtobufList()Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method private clearTraceDescription()V
    .locals 1

    .line 10293
    invoke-static {}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->getDefaultInstance()Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->getTraceDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    return-void
.end method

.method private clearTraceId()V
    .locals 1

    .line 10152
    invoke-static {}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->getDefaultInstance()Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->getTraceId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    return-void
.end method

.method private ensureActionIsMutable()V
    .locals 2

    .line 10203
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 10204
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 10206
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1

    .line 10669
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;
    .locals 1

    .line 10381
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-virtual {v0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;
    .locals 1

    .line 10384
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-virtual {v0, p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10358
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10364
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10322
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10329
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10369
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10376
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10346
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10353
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10309
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10316
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10334
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10341
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;",
            ">;"
        }
    .end annotation

    .line 10675
    sget-object v0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-virtual {v0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private removeAction(I)V
    .locals 1

    .line 10255
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->ensureActionIsMutable()V

    .line 10256
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private setAction(ILcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;)V
    .locals 1

    .line 10215
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10216
    invoke-direct {p0}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->ensureActionIsMutable()V

    .line 10217
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/Internal$ProtobufList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setTraceDescription(Ljava/lang/String;)V
    .locals 0

    .line 10284
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10286
    iput-object p1, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    return-void
.end method

.method private setTraceDescriptionBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 10301
    invoke-static {p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 10302
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    return-void
.end method

.method private setTraceId(Ljava/lang/String;)V
    .locals 0

    .line 10143
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10145
    iput-object p1, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    return-void
.end method

.method private setTraceIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 10160
    invoke-static {p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 10161
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 10608
    sget-object p2, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 10653
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 10647
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 10632
    :pswitch_2
    sget-object p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    .line 10634
    const-class p2, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    monitor-enter p2

    .line 10635
    :try_start_0
    sget-object p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 10637
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 10640
    sput-object p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->PARSER:Lcom/google/protobuf/Parser;

    .line 10642
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

    .line 10629
    :pswitch_3
    sget-object p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "traceId_"

    aput-object v0, p1, p3

    const-string p3, "action_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 10616
    const-class p3, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-string p3, "traceDescription_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u0208\u0002\u001b\u0003\u0208"

    .line 10625
    sget-object p3, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->DEFAULT_INSTANCE:Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-static {p3, p2, p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 10613
    :pswitch_5
    new-instance p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;

    invoke-direct {p1, p3}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace$Builder;-><init>(Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$1;)V

    return-object p1

    .line 10610
    :pswitch_6
    new-instance p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;

    invoke-direct {p1}, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;-><init>()V

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

.method public getAction(I)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;
    .locals 1

    .line 10193
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;

    return-object p1
.end method

.method public getActionCount()I
    .locals 1

    .line 10186
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->size()I

    move-result v0

    return v0
.end method

.method public getActionList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreAction;",
            ">;"
        }
    .end annotation

    .line 10172
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getActionOrBuilder(I)Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreActionOrBuilder;
    .locals 1

    .line 10200
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0, p1}, Lcom/google/protobuf/Internal$ProtobufList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreActionOrBuilder;

    return-object p1
.end method

.method public getActionOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$DatastoreActionOrBuilder;",
            ">;"
        }
    .end annotation

    .line 10179
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->action_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object v0
.end method

.method public getTraceDescription()Ljava/lang/String;
    .locals 1

    .line 10267
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    return-object v0
.end method

.method public getTraceDescriptionBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 10276
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceDescription_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getTraceId()Ljava/lang/String;
    .locals 1

    .line 10126
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    return-object v0
.end method

.method public getTraceIdBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 10135
    iget-object v0, p0, Lcom/google/apphosting/datastore/testing/DatastoreTestTrace$TestTrace;->traceId_:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method
