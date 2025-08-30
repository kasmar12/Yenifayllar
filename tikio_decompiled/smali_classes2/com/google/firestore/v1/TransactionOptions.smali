.class public final Lcom/google/firestore/v1/TransactionOptions;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "TransactionOptions.java"

# interfaces
.implements Lcom/google/firestore/v1/TransactionOptionsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/TransactionOptions$Builder;,
        Lcom/google/firestore/v1/TransactionOptions$ModeCase;,
        Lcom/google/firestore/v1/TransactionOptions$ReadOnly;,
        Lcom/google/firestore/v1/TransactionOptions$ReadOnlyOrBuilder;,
        Lcom/google/firestore/v1/TransactionOptions$ReadWrite;,
        Lcom/google/firestore/v1/TransactionOptions$ReadWriteOrBuilder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/TransactionOptions;",
        "Lcom/google/firestore/v1/TransactionOptions$Builder;",
        ">;",
        "Lcom/google/firestore/v1/TransactionOptionsOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ_ONLY_FIELD_NUMBER:I = 0x2

.field public static final READ_WRITE_FIELD_NUMBER:I = 0x3


# instance fields
.field private modeCase_:I

.field private mode_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1220
    new-instance v0, Lcom/google/firestore/v1/TransactionOptions;

    invoke-direct {v0}, Lcom/google/firestore/v1/TransactionOptions;-><init>()V

    .line 1223
    sput-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    .line 1224
    const-class v1, Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const/4 v0, 0x0

    .line 723
    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    return-void
.end method

.method static synthetic access$1000()Lcom/google/firestore/v1/TransactionOptions;
    .locals 1

    .line 13
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions;->clearMode()V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/firestore/v1/TransactionOptions;Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions;->setReadOnly(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/firestore/v1/TransactionOptions;Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions;->mergeReadOnly(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions;->clearReadOnly()V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/firestore/v1/TransactionOptions;Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions;->setReadWrite(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/google/firestore/v1/TransactionOptions;Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/TransactionOptions;->mergeReadWrite(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/firestore/v1/TransactionOptions;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/google/firestore/v1/TransactionOptions;->clearReadWrite()V

    return-void
.end method

.method private clearMode()V
    .locals 1

    const/4 v0, 0x0

    .line 762
    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v0, 0x0

    .line 763
    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    return-void
.end method

.method private clearReadOnly()V
    .locals 2

    .line 830
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 831
    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v0, 0x0

    .line 832
    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private clearReadWrite()V
    .locals 2

    .line 900
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 901
    iput v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v0, 0x0

    .line 902
    iput-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions;
    .locals 1

    .line 1229
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    return-object v0
.end method

.method private mergeReadOnly(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 3

    .line 812
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 813
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    .line 814
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    move-result-object v2

    if-eq v0, v2, :cond_0

    .line 815
    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    invoke-static {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->newBuilder(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;

    move-result-object v0

    .line 816
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    goto :goto_0

    .line 818
    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    .line 820
    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    return-void
.end method

.method private mergeReadWrite(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V
    .locals 3

    .line 882
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 883
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    .line 884
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    move-result-object v2

    if-eq v0, v2, :cond_0

    .line 885
    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    invoke-static {v0}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->newBuilder(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;

    move-result-object v0

    .line 886
    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    goto :goto_0

    .line 888
    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    .line 890
    :goto_0
    iput v1, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/TransactionOptions$Builder;
    .locals 1

    .line 981
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/TransactionOptions;)Lcom/google/firestore/v1/TransactionOptions$Builder;
    .locals 1

    .line 984
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/TransactionOptions;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 958
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/firestore/v1/TransactionOptions;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 964
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/TransactionOptions;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 922
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 929
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 969
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 976
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 946
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 953
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 909
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 916
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 934
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/TransactionOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 941
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/TransactionOptions;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/TransactionOptions;",
            ">;"
        }
    .end annotation

    .line 1235
    sget-object v0, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-virtual {v0}, Lcom/google/firestore/v1/TransactionOptions;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setReadOnly(Lcom/google/firestore/v1/TransactionOptions$ReadOnly;)V
    .locals 0

    .line 800
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 801
    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    const/4 p1, 0x2

    .line 802
    iput p1, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    return-void
.end method

.method private setReadWrite(Lcom/google/firestore/v1/TransactionOptions$ReadWrite;)V
    .locals 0

    .line 870
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 871
    iput-object p1, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    const/4 p1, 0x3

    .line 872
    iput p1, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1168
    sget-object p2, Lcom/google/firestore/v1/TransactionOptions$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 1213
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 1207
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 1192
    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    .line 1194
    const-class p2, Lcom/google/firestore/v1/TransactionOptions;

    monitor-enter p2

    .line 1195
    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 1197
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 1200
    sput-object p1, Lcom/google/firestore/v1/TransactionOptions;->PARSER:Lcom/google/protobuf/Parser;

    .line 1202
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

    .line 1189
    :pswitch_3
    sget-object p1, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    return-object p1

    :pswitch_4
    const/4 p1, 0x4

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "mode_"

    aput-object v0, p1, p3

    const-string p3, "modeCase_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    .line 1176
    const-class p3, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    aput-object p3, p1, p2

    const/4 p2, 0x3

    const-class p3, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0002\u0001\u0000\u0002\u0003\u0002\u0000\u0000\u0000\u0002<\u0000\u0003<\u0000"

    .line 1185
    sget-object p3, Lcom/google/firestore/v1/TransactionOptions;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/TransactionOptions;

    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/TransactionOptions;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1173
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/TransactionOptions$Builder;-><init>(Lcom/google/firestore/v1/TransactionOptions$1;)V

    return-object p1

    .line 1170
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/TransactionOptions;

    invoke-direct {p1}, Lcom/google/firestore/v1/TransactionOptions;-><init>()V

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

.method public getModeCase()Lcom/google/firestore/v1/TransactionOptions$ModeCase;
    .locals 1

    .line 757
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    invoke-static {v0}, Lcom/google/firestore/v1/TransactionOptions$ModeCase;->forNumber(I)Lcom/google/firestore/v1/TransactionOptions$ModeCase;

    move-result-object v0

    return-object v0
.end method

.method public getReadOnly()Lcom/google/firestore/v1/TransactionOptions$ReadOnly;
    .locals 2

    .line 787
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 788
    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    return-object v0

    .line 790
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions$ReadOnly;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadOnly;

    move-result-object v0

    return-object v0
.end method

.method public getReadWrite()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;
    .locals 2

    .line 857
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 858
    iget-object v0, p0, Lcom/google/firestore/v1/TransactionOptions;->mode_:Ljava/lang/Object;

    check-cast v0, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    return-object v0

    .line 860
    :cond_0
    invoke-static {}, Lcom/google/firestore/v1/TransactionOptions$ReadWrite;->getDefaultInstance()Lcom/google/firestore/v1/TransactionOptions$ReadWrite;

    move-result-object v0

    return-object v0
.end method

.method public hasReadOnly()Z
    .locals 2

    .line 776
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasReadWrite()Z
    .locals 2

    .line 846
    iget v0, p0, Lcom/google/firestore/v1/TransactionOptions;->modeCase_:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
