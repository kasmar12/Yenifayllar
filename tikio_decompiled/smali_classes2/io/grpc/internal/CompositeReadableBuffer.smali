.class public Lio/grpc/internal/CompositeReadableBuffer;
.super Lio/grpc/internal/AbstractReadableBuffer;
.source "CompositeReadableBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;,
        Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;
    }
.end annotation


# static fields
.field private static final BYTE_ARRAY_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
            "[B>;"
        }
    .end annotation
.end field

.field private static final BYTE_BUF_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private static final SKIP_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private static final STREAM_OP:Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/CompositeReadableBuffer$ReadOperation<",
            "Ljava/io/OutputStream;",
            ">;"
        }
    .end annotation
.end field

.field private static final UBYTE_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private marked:Z

.field private final readableBuffers:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lio/grpc/internal/ReadableBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private readableBytes:I

.field private rewindableBuffers:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lio/grpc/internal/ReadableBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 87
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer$1;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer$1;-><init>()V

    sput-object v0, Lio/grpc/internal/CompositeReadableBuffer;->UBYTE_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    .line 100
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer$2;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer$2;-><init>()V

    sput-object v0, Lio/grpc/internal/CompositeReadableBuffer;->SKIP_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    .line 114
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer$3;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer$3;-><init>()V

    sput-object v0, Lio/grpc/internal/CompositeReadableBuffer;->BYTE_ARRAY_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    .line 128
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer$4;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer$4;-><init>()V

    sput-object v0, Lio/grpc/internal/CompositeReadableBuffer;->BYTE_BUF_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    .line 147
    new-instance v0, Lio/grpc/internal/CompositeReadableBuffer$5;

    invoke-direct {v0}, Lio/grpc/internal/CompositeReadableBuffer$5;-><init>()V

    sput-object v0, Lio/grpc/internal/CompositeReadableBuffer;->STREAM_OP:Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Lio/grpc/internal/AbstractReadableBuffer;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 43
    invoke-direct {p0}, Lio/grpc/internal/AbstractReadableBuffer;-><init>()V

    .line 44
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, p1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    return-void
.end method

.method private advanceBuffer()V
    .locals 2

    .line 329
    iget-boolean v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->marked:Z

    if-eqz v0, :cond_0

    .line 330
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    iget-object v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 331
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    if-eqz v0, :cond_1

    .line 333
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->mark()V

    goto :goto_0

    .line 336
    :cond_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->close()V

    :cond_1
    :goto_0
    return-void
.end method

.method private advanceBufferIfNecessary()V
    .locals 1

    .line 319
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    .line 320
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v0

    if-nez v0, :cond_0

    .line 321
    invoke-direct {p0}, Lio/grpc/internal/CompositeReadableBuffer;->advanceBuffer()V

    :cond_0
    return-void
.end method

.method private enqueueBuffer(Lio/grpc/internal/ReadableBuffer;)V
    .locals 2

    .line 66
    instance-of v0, p1, Lio/grpc/internal/CompositeReadableBuffer;

    if-nez v0, :cond_0

    .line 67
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 68
    iget v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result p1

    add-int/2addr v0, p1

    iput v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    return-void

    .line 72
    :cond_0
    check-cast p1, Lio/grpc/internal/CompositeReadableBuffer;

    .line 73
    :goto_0
    iget-object v0, p1, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 74
    iget-object v0, p1, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    .line 75
    iget-object v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v1, v0}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    :cond_1
    iget v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    iget v1, p1, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    add-int/2addr v0, v1

    iput v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    const/4 v0, 0x0

    .line 78
    iput v0, p1, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    .line 79
    invoke-virtual {p1}, Lio/grpc/internal/CompositeReadableBuffer;->close()V

    return-void
.end method

.method private execute(Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;ILjava/lang/Object;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/CompositeReadableBuffer$ReadOperation<",
            "TT;>;ITT;I)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 282
    invoke-virtual {p0, p2}, Lio/grpc/internal/CompositeReadableBuffer;->checkReadable(I)V

    .line 284
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 285
    invoke-direct {p0}, Lio/grpc/internal/CompositeReadableBuffer;->advanceBufferIfNecessary()V

    :cond_0
    :goto_0
    if-lez p2, :cond_1

    .line 288
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 289
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    .line 290
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v1

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 293
    invoke-interface {p1, v0, v1, p3, p4}, Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;->read(Lio/grpc/internal/ReadableBuffer;ILjava/lang/Object;I)I

    move-result p4

    sub-int/2addr p2, v1

    .line 296
    iget v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    sub-int/2addr v0, v1

    iput v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    .line 288
    invoke-direct {p0}, Lio/grpc/internal/CompositeReadableBuffer;->advanceBufferIfNecessary()V

    goto :goto_0

    :cond_1
    if-gtz p2, :cond_2

    return p4

    .line 301
    :cond_2
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Failed executing read operation"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method private executeNoThrow(Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;ILjava/lang/Object;I)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation<",
            "TT;>;ITT;I)I"
        }
    .end annotation

    .line 309
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lio/grpc/internal/CompositeReadableBuffer;->execute(Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;ILjava/lang/Object;I)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 311
    new-instance p2, Ljava/lang/AssertionError;

    invoke-direct {p2, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2
.end method


# virtual methods
.method public addBuffer(Lio/grpc/internal/ReadableBuffer;)V
    .locals 1

    .line 58
    iget-boolean v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->marked:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 59
    :goto_0
    invoke-direct {p0, p1}, Lio/grpc/internal/CompositeReadableBuffer;->enqueueBuffer(Lio/grpc/internal/ReadableBuffer;)V

    if-eqz v0, :cond_1

    .line 61
    iget-object p1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {p1}, Lio/grpc/internal/ReadableBuffer;->mark()V

    :cond_1
    return-void
.end method

.method public byteBufferSupported()Z
    .locals 2

    .line 248
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/internal/ReadableBuffer;

    .line 249
    invoke-interface {v1}, Lio/grpc/internal/ReadableBuffer;->byteBufferSupported()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public close()V
    .locals 1

    .line 267
    :goto_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->close()V

    goto :goto_0

    .line 270
    :cond_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    if-eqz v0, :cond_1

    .line 271
    :goto_1
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 272
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->close()V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 259
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 262
    :cond_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public mark()V
    .locals 3

    .line 215
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    if-nez v0, :cond_0

    .line 216
    new-instance v0, Ljava/util/ArrayDeque;

    iget-object v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->size()I

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    .line 218
    :cond_0
    :goto_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 219
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->close()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 221
    iput-boolean v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->marked:Z

    .line 222
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    if-eqz v0, :cond_2

    .line 224
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->mark()V

    :cond_2
    return-void
.end method

.method public markSupported()Z
    .locals 2

    .line 205
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/internal/ReadableBuffer;

    .line 206
    invoke-interface {v1}, Lio/grpc/internal/ReadableBuffer;->markSupported()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public readBytes(I)Lio/grpc/internal/ReadableBuffer;
    .locals 6

    if-gtz p1, :cond_0

    .line 165
    invoke-static {}, Lio/grpc/internal/ReadableBuffers;->empty()Lio/grpc/internal/ReadableBuffer;

    move-result-object p1

    return-object p1

    .line 167
    :cond_0
    invoke-virtual {p0, p1}, Lio/grpc/internal/CompositeReadableBuffer;->checkReadable(I)V

    .line 168
    iget v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    sub-int/2addr v0, p1

    iput v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    const/4 v0, 0x0

    move-object v1, v0

    .line 173
    :goto_0
    iget-object v2, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/internal/ReadableBuffer;

    .line 174
    invoke-interface {v2}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v3

    if-le v3, p1, :cond_1

    .line 177
    invoke-interface {v2, p1}, Lio/grpc/internal/ReadableBuffer;->readBytes(I)Lio/grpc/internal/ReadableBuffer;

    move-result-object p1

    const/4 v2, 0x0

    goto :goto_2

    .line 180
    :cond_1
    iget-boolean v4, p0, Lio/grpc/internal/CompositeReadableBuffer;->marked:Z

    if-eqz v4, :cond_2

    .line 181
    invoke-interface {v2, v3}, Lio/grpc/internal/ReadableBuffer;->readBytes(I)Lio/grpc/internal/ReadableBuffer;

    move-result-object v2

    .line 182
    invoke-direct {p0}, Lio/grpc/internal/CompositeReadableBuffer;->advanceBuffer()V

    goto :goto_1

    .line 184
    :cond_2
    iget-object v2, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/internal/ReadableBuffer;

    :goto_1
    sub-int/2addr p1, v3

    move-object v5, v2

    move v2, p1

    move-object p1, v5

    :goto_2
    if-nez v0, :cond_3

    move-object v0, p1

    goto :goto_4

    :cond_3
    if-nez v1, :cond_5

    .line 192
    new-instance v1, Lio/grpc/internal/CompositeReadableBuffer;

    const/4 v3, 0x2

    if-nez v2, :cond_4

    goto :goto_3

    .line 193
    :cond_4
    iget-object v4, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v4}, Ljava/util/Deque;->size()I

    move-result v4

    add-int/2addr v4, v3

    const/16 v3, 0x10

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    :goto_3
    invoke-direct {v1, v3}, Lio/grpc/internal/CompositeReadableBuffer;-><init>(I)V

    .line 194
    invoke-virtual {v1, v0}, Lio/grpc/internal/CompositeReadableBuffer;->addBuffer(Lio/grpc/internal/ReadableBuffer;)V

    move-object v0, v1

    .line 197
    :cond_5
    invoke-virtual {v1, p1}, Lio/grpc/internal/CompositeReadableBuffer;->addBuffer(Lio/grpc/internal/ReadableBuffer;)V

    :goto_4
    if-gtz v2, :cond_6

    return-object v0

    :cond_6
    move p1, v2

    goto :goto_0
.end method

.method public readBytes(Ljava/io/OutputStream;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    sget-object v0, Lio/grpc/internal/CompositeReadableBuffer;->STREAM_OP:Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, p1, v1}, Lio/grpc/internal/CompositeReadableBuffer;->execute(Lio/grpc/internal/CompositeReadableBuffer$ReadOperation;ILjava/lang/Object;I)I

    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 144
    sget-object v0, Lio/grpc/internal/CompositeReadableBuffer;->BYTE_BUF_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p1, v2}, Lio/grpc/internal/CompositeReadableBuffer;->executeNoThrow(Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;ILjava/lang/Object;I)I

    return-void
.end method

.method public readBytes([BII)V
    .locals 1

    .line 125
    sget-object v0, Lio/grpc/internal/CompositeReadableBuffer;->BYTE_ARRAY_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    invoke-direct {p0, v0, p3, p1, p2}, Lio/grpc/internal/CompositeReadableBuffer;->executeNoThrow(Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;ILjava/lang/Object;I)I

    return-void
.end method

.method public readUnsignedByte()I
    .locals 4

    .line 97
    sget-object v0, Lio/grpc/internal/CompositeReadableBuffer;->UBYTE_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lio/grpc/internal/CompositeReadableBuffer;->executeNoThrow(Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;ILjava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public readableBytes()I
    .locals 1

    .line 84
    iget v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    return v0
.end method

.method public reset()V
    .locals 3

    .line 230
    iget-boolean v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->marked:Z

    if-eqz v0, :cond_2

    .line 234
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    if-eqz v0, :cond_0

    .line 235
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v1

    .line 236
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->reset()V

    .line 237
    iget v2, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v0

    sub-int/2addr v0, v1

    add-int/2addr v2, v0

    iput v2, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    .line 239
    :cond_0
    :goto_0
    iget-object v0, p0, Lio/grpc/internal/CompositeReadableBuffer;->rewindableBuffers:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/internal/ReadableBuffer;

    if-eqz v0, :cond_1

    .line 240
    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->reset()V

    .line 241
    iget-object v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBuffers:Ljava/util/Deque;

    invoke-interface {v1, v0}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    .line 242
    iget v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    invoke-interface {v0}, Lio/grpc/internal/ReadableBuffer;->readableBytes()I

    move-result v0

    add-int/2addr v1, v0

    iput v1, p0, Lio/grpc/internal/CompositeReadableBuffer;->readableBytes:I

    goto :goto_0

    :cond_1
    return-void

    .line 231
    :cond_2
    new-instance v0, Ljava/nio/InvalidMarkException;

    invoke-direct {v0}, Ljava/nio/InvalidMarkException;-><init>()V

    throw v0
.end method

.method public skipBytes(I)V
    .locals 3

    .line 111
    sget-object v0, Lio/grpc/internal/CompositeReadableBuffer;->SKIP_OP:Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, p1, v1, v2}, Lio/grpc/internal/CompositeReadableBuffer;->executeNoThrow(Lio/grpc/internal/CompositeReadableBuffer$NoThrowReadOperation;ILjava/lang/Object;I)I

    return-void
.end method
