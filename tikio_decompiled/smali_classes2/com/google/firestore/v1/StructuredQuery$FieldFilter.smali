.class public final Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "StructuredQuery.java"

# interfaces
.implements Lcom/google/firestore/v1/StructuredQuery$FieldFilterOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/StructuredQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FieldFilter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;,
        Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/firestore/v1/StructuredQuery$FieldFilter;",
        "Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;",
        ">;",
        "Lcom/google/firestore/v1/StructuredQuery$FieldFilterOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

.field public static final FIELD_FIELD_NUMBER:I = 0x1

.field public static final OP_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$FieldFilter;",
            ">;"
        }
    .end annotation
.end field

.field public static final VALUE_FIELD_NUMBER:I = 0x3


# instance fields
.field private field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

.field private op_:I

.field private value_:Lcom/google/firestore/v1/Value;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 3100
    new-instance v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-direct {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;-><init>()V

    .line 3103
    sput-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    .line 3104
    const-class v1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 2231
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    return-void
.end method

.method static synthetic access$3000()Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1

    .line 2226
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->setField(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->mergeField(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V

    return-void
.end method

.method static synthetic access$3300(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 2226
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->clearField()V

    return-void
.end method

.method static synthetic access$3400(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;I)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->setOpValue(I)V

    return-void
.end method

.method static synthetic access$3500(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->setOp(Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 2226
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->clearOp()V

    return-void
.end method

.method static synthetic access$3700(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->setValue(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$3800(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 2226
    invoke-direct {p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->mergeValue(Lcom/google/firestore/v1/Value;)V

    return-void
.end method

.method static synthetic access$3900(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)V
    .locals 0

    .line 2226
    invoke-direct {p0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->clearValue()V

    return-void
.end method

.method private clearField()V
    .locals 1

    const/4 v0, 0x0

    .line 2603
    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    return-void
.end method

.method private clearOp()V
    .locals 1

    const/4 v0, 0x0

    .line 2666
    iput v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->op_:I

    return-void
.end method

.method private clearValue()V
    .locals 1

    const/4 v0, 0x0

    .line 2731
    iput-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1

    .line 3109
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object v0
.end method

.method private mergeField(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 2

    .line 2586
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2587
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    if-eqz v0, :cond_0

    .line 2588
    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$FieldReference;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 2589
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    .line 2590
    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldReference;->newBuilder(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)Lcom/google/firestore/v1/StructuredQuery$FieldReference$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldReference$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$FieldReference$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$FieldReference$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    goto :goto_0

    .line 2592
    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    :goto_0
    return-void
.end method

.method private mergeValue(Lcom/google/firestore/v1/Value;)V
    .locals 2

    .line 2714
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2715
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    if-eqz v0, :cond_0

    .line 2716
    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 2717
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    .line 2718
    invoke-static {v0}, Lcom/google/firestore/v1/Value;->newBuilder(Lcom/google/firestore/v1/Value;)Lcom/google/firestore/v1/Value$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firestore/v1/Value$Builder;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value$Builder;

    invoke-virtual {p1}, Lcom/google/firestore/v1/Value$Builder;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/firestore/v1/Value;

    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    goto :goto_0

    .line 2720
    :cond_0
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    :goto_0
    return-void
.end method

.method public static newBuilder()Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;
    .locals 1

    .line 2810
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/firestore/v1/StructuredQuery$FieldFilter;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;
    .locals 1

    .line 2813
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-virtual {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2787
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2793
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2751
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2758
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2798
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2805
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2775
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2782
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2738
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2745
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2763
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/firestore/v1/StructuredQuery$FieldFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 2770
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/firestore/v1/StructuredQuery$FieldFilter;",
            ">;"
        }
    .end annotation

    .line 3115
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-virtual {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setField(Lcom/google/firestore/v1/StructuredQuery$FieldReference;)V
    .locals 0

    .line 2573
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2574
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    return-void
.end method

.method private setOp(Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;)V
    .locals 0

    .line 2654
    invoke-virtual {p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->op_:I

    return-void
.end method

.method private setOpValue(I)V
    .locals 0

    .line 2643
    iput p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->op_:I

    return-void
.end method

.method private setValue(Lcom/google/firestore/v1/Value;)V
    .locals 0

    .line 2701
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2702
    iput-object p1, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 3049
    sget-object p2, Lcom/google/firestore/v1/StructuredQuery$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    packed-switch p1, :pswitch_data_0

    .line 3093
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    return-object p3

    .line 3087
    :pswitch_1
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    .line 3072
    :pswitch_2
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    .line 3074
    const-class p2, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    monitor-enter p2

    .line 3075
    :try_start_0
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_0

    .line 3077
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 3080
    sput-object p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->PARSER:Lcom/google/protobuf/Parser;

    .line 3082
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

    .line 3069
    :pswitch_3
    sget-object p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    return-object p1

    :pswitch_4
    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    const-string v0, "field_"

    aput-object v0, p1, p3

    const-string p3, "op_"

    aput-object p3, p1, p2

    const/4 p2, 0x2

    const-string p3, "value_"

    aput-object p3, p1, p2

    const-string p2, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\t\u0002\u000c\u0003\t"

    .line 3065
    sget-object p3, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->DEFAULT_INSTANCE:Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-static {p3, p2, p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 3054
    :pswitch_5
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;

    invoke-direct {p1, p3}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Builder;-><init>(Lcom/google/firestore/v1/StructuredQuery$1;)V

    return-object p1

    .line 3051
    :pswitch_6
    new-instance p1, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;

    invoke-direct {p1}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;-><init>()V

    return-object p1

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

.method public getField()Lcom/google/firestore/v1/StructuredQuery$FieldReference;
    .locals 1

    .line 2563
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/firestore/v1/StructuredQuery$FieldReference;->getDefaultInstance()Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getOp()Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;
    .locals 1

    .line 2631
    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->op_:I

    invoke-static {v0}, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;->forNumber(I)Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2632
    sget-object v0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;->UNRECOGNIZED:Lcom/google/firestore/v1/StructuredQuery$FieldFilter$Operator;

    :cond_0
    return-object v0
.end method

.method public getOpValue()I
    .locals 1

    .line 2619
    iget v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->op_:I

    return v0
.end method

.method public getValue()Lcom/google/firestore/v1/Value;
    .locals 1

    .line 2691
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/firestore/v1/Value;->getDefaultInstance()Lcom/google/firestore/v1/Value;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public hasField()Z
    .locals 1

    .line 2552
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->field_:Lcom/google/firestore/v1/StructuredQuery$FieldReference;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasValue()Z
    .locals 1

    .line 2680
    iget-object v0, p0, Lcom/google/firestore/v1/StructuredQuery$FieldFilter;->value_:Lcom/google/firestore/v1/Value;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
