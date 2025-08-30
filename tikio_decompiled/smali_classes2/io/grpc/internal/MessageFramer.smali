.class public Lio/grpc/internal/MessageFramer;
.super Ljava/lang/Object;
.source "MessageFramer.java"

# interfaces
.implements Lio/grpc/internal/Framer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/MessageFramer$BufferChainOutputStream;,
        Lio/grpc/internal/MessageFramer$OutputStreamAdapter;,
        Lio/grpc/internal/MessageFramer$Sink;
    }
.end annotation


# static fields
.field private static final COMPRESSED:B = 0x1t

.field private static final HEADER_LENGTH:I = 0x5

.field private static final NO_MAX_OUTBOUND_MESSAGE_SIZE:I = -0x1

.field private static final UNCOMPRESSED:B


# instance fields
.field private buffer:Lio/grpc/internal/WritableBuffer;

.field private final bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

.field private closed:Z

.field private compressor:Lio/grpc/Compressor;

.field private currentMessageSeqNo:I

.field private currentMessageWireSize:J

.field private final headerScratch:Ljava/nio/ByteBuffer;

.field private maxOutboundMessageSize:I

.field private messageCompression:Z

.field private messagesBuffered:I

.field private final outputStreamAdapter:Lio/grpc/internal/MessageFramer$OutputStreamAdapter;

.field private final sink:Lio/grpc/internal/MessageFramer$Sink;

.field private final statsTraceCtx:Lio/grpc/internal/StatsTraceContext;


# direct methods
.method public constructor <init>(Lio/grpc/internal/MessageFramer$Sink;Lio/grpc/internal/WritableBufferAllocator;Lio/grpc/internal/StatsTraceContext;)V
    .locals 3

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 75
    iput v0, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    .line 77
    sget-object v1, Lio/grpc/Codec$Identity;->NONE:Lio/grpc/Codec;

    iput-object v1, p0, Lio/grpc/internal/MessageFramer;->compressor:Lio/grpc/Compressor;

    const/4 v1, 0x1

    .line 78
    iput-boolean v1, p0, Lio/grpc/internal/MessageFramer;->messageCompression:Z

    .line 79
    new-instance v1, Lio/grpc/internal/MessageFramer$OutputStreamAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lio/grpc/internal/MessageFramer$OutputStreamAdapter;-><init>(Lio/grpc/internal/MessageFramer;Lio/grpc/internal/MessageFramer$1;)V

    iput-object v1, p0, Lio/grpc/internal/MessageFramer;->outputStreamAdapter:Lio/grpc/internal/MessageFramer$OutputStreamAdapter;

    const/4 v1, 0x5

    .line 80
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    .line 88
    iput v0, p0, Lio/grpc/internal/MessageFramer;->currentMessageSeqNo:I

    const-string v0, "sink"

    .line 99
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/MessageFramer$Sink;

    iput-object p1, p0, Lio/grpc/internal/MessageFramer;->sink:Lio/grpc/internal/MessageFramer$Sink;

    const-string p1, "bufferAllocator"

    .line 100
    invoke-static {p2, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/WritableBufferAllocator;

    iput-object p1, p0, Lio/grpc/internal/MessageFramer;->bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

    const-string p1, "statsTraceCtx"

    .line 101
    invoke-static {p3, p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/StatsTraceContext;

    iput-object p1, p0, Lio/grpc/internal/MessageFramer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    return-void
.end method

.method static synthetic access$400(Lio/grpc/internal/MessageFramer;[BII)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/internal/MessageFramer;->writeRaw([BII)V

    return-void
.end method

.method static synthetic access$500(Lio/grpc/internal/MessageFramer;)Lio/grpc/internal/WritableBufferAllocator;
    .locals 0

    .line 44
    iget-object p0, p0, Lio/grpc/internal/MessageFramer;->bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

    return-object p0
.end method

.method private commitToSink(ZZ)V
    .locals 3

    .line 352
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    const/4 v1, 0x0

    .line 353
    iput-object v1, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    .line 354
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->sink:Lio/grpc/internal/MessageFramer$Sink;

    iget v2, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    invoke-interface {v1, v0, p1, p2, v2}, Lio/grpc/internal/MessageFramer$Sink;->deliverFrame(Lio/grpc/internal/WritableBuffer;ZZI)V

    const/4 p1, 0x0

    .line 355
    iput p1, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    return-void
.end method

.method private getKnownLength(Ljava/io/InputStream;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    instance-of v0, p1, Lio/grpc/KnownLength;

    if-nez v0, :cond_1

    instance-of v0, p1, Ljava/io/ByteArrayInputStream;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    return p1

    .line 208
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result p1

    return p1
.end method

.method private releaseBuffer()V
    .locals 1

    .line 345
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-eqz v0, :cond_0

    .line 346
    invoke-interface {v0}, Lio/grpc/internal/WritableBuffer;->release()V

    const/4 v0, 0x0

    .line 347
    iput-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    :cond_0
    return-void
.end method

.method private verifyNotClosed()V
    .locals 2

    .line 359
    invoke-virtual {p0}, Lio/grpc/internal/MessageFramer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 360
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Framer already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private writeBufferChain(Lio/grpc/internal/MessageFramer$BufferChainOutputStream;Z)V
    .locals 5

    .line 240
    invoke-static {p1}, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;->access$200(Lio/grpc/internal/MessageFramer$BufferChainOutputStream;)I

    move-result v0

    .line 241
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 242
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 243
    iget-object p2, p0, Lio/grpc/internal/MessageFramer;->bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

    const/4 v1, 0x5

    invoke-interface {p2, v1}, Lio/grpc/internal/WritableBufferAllocator;->allocate(I)Lio/grpc/internal/WritableBuffer;

    move-result-object p2

    .line 244
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v2, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    const/4 v3, 0x0

    invoke-interface {p2, v1, v3, v2}, Lio/grpc/internal/WritableBuffer;->write([BII)V

    if-nez v0, :cond_0

    .line 247
    iput-object p2, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    return-void

    .line 255
    :cond_0
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->sink:Lio/grpc/internal/MessageFramer$Sink;

    iget v2, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    const/4 v4, 0x1

    sub-int/2addr v2, v4

    invoke-interface {v1, p2, v3, v3, v2}, Lio/grpc/internal/MessageFramer$Sink;->deliverFrame(Lio/grpc/internal/WritableBuffer;ZZI)V

    .line 256
    iput v4, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    .line 258
    invoke-static {p1}, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;->access$300(Lio/grpc/internal/MessageFramer$BufferChainOutputStream;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    .line 259
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v4

    if-ge p2, v1, :cond_1

    .line 260
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->sink:Lio/grpc/internal/MessageFramer$Sink;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/internal/WritableBuffer;

    invoke-interface {v1, v2, v3, v3, v3}, Lio/grpc/internal/MessageFramer$Sink;->deliverFrame(Lio/grpc/internal/WritableBuffer;ZZI)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 264
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    sub-int/2addr p2, v4

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/internal/WritableBuffer;

    iput-object p1, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    int-to-long p1, v0

    .line 265
    iput-wide p1, p0, Lio/grpc/internal/MessageFramer;->currentMessageWireSize:J

    return-void
.end method

.method private writeCompressed(Ljava/io/InputStream;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    new-instance p2, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;-><init>(Lio/grpc/internal/MessageFramer;Lio/grpc/internal/MessageFramer$1;)V

    .line 187
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->compressor:Lio/grpc/Compressor;

    invoke-interface {v0, p2}, Lio/grpc/Compressor;->compress(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    .line 190
    :try_start_0
    invoke-static {p1, v0}, Lio/grpc/internal/MessageFramer;->writeToOutputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 194
    iget v0, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    const/4 v1, 0x1

    if-ltz v0, :cond_1

    if-gt p1, v0, :cond_0

    goto :goto_0

    .line 195
    :cond_0
    sget-object p2, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 198
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    iget p1, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    const-string p1, "message too large %d > %d"

    .line 197
    invoke-static {v0, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 196
    invoke-virtual {p2, p1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 199
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    .line 202
    :cond_1
    :goto_0
    invoke-direct {p0, p2, v1}, Lio/grpc/internal/MessageFramer;->writeBufferChain(Lio/grpc/internal/MessageFramer$BufferChainOutputStream;Z)V

    return p1

    :catchall_0
    move-exception p1

    .line 192
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    throw p1
.end method

.method private writeKnownLengthUncompressed(Ljava/io/InputStream;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget v0, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    const/4 v1, 0x0

    if-ltz v0, :cond_1

    if-gt p2, v0, :cond_0

    goto :goto_0

    .line 219
    :cond_0
    sget-object p1, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 222
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v2, v1

    const/4 p2, 0x1

    iget v1, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, p2

    const-string p2, "message too large %d > %d"

    .line 221
    invoke-static {v0, p2, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 220
    invoke-virtual {p1, p2}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 223
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    .line 225
    :cond_1
    :goto_0
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 226
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 229
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-nez v0, :cond_2

    .line 230
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

    iget-object v2, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, p2

    invoke-interface {v0, v2}, Lio/grpc/internal/WritableBufferAllocator;->allocate(I)Lio/grpc/internal/WritableBuffer;

    move-result-object p2

    iput-object p2, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    .line 232
    :cond_2
    iget-object p2, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->headerScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-direct {p0, p2, v1, v0}, Lio/grpc/internal/MessageFramer;->writeRaw([BII)V

    .line 233
    iget-object p2, p0, Lio/grpc/internal/MessageFramer;->outputStreamAdapter:Lio/grpc/internal/MessageFramer$OutputStreamAdapter;

    invoke-static {p1, p2}, Lio/grpc/internal/MessageFramer;->writeToOutputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    move-result p1

    return p1
.end method

.method private writeRaw([BII)V
    .locals 2

    :goto_0
    if-lez p3, :cond_2

    .line 284
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/grpc/internal/WritableBuffer;->writableBytes()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 285
    invoke-direct {p0, v0, v0}, Lio/grpc/internal/MessageFramer;->commitToSink(ZZ)V

    .line 287
    :cond_0
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-nez v0, :cond_1

    .line 289
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->bufferAllocator:Lio/grpc/internal/WritableBufferAllocator;

    invoke-interface {v0, p3}, Lio/grpc/internal/WritableBufferAllocator;->allocate(I)Lio/grpc/internal/WritableBuffer;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    .line 291
    :cond_1
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    invoke-interface {v0}, Lio/grpc/internal/WritableBuffer;->writableBytes()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 292
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    invoke-interface {v1, p1, p2, v0}, Lio/grpc/internal/WritableBuffer;->write([BII)V

    add-int/2addr p2, v0

    sub-int/2addr p3, v0

    goto :goto_0

    :cond_2
    return-void
.end method

.method private static writeToOutputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 270
    instance-of v0, p0, Lio/grpc/Drainable;

    if-eqz v0, :cond_0

    .line 271
    check-cast p0, Lio/grpc/Drainable;

    invoke-interface {p0, p1}, Lio/grpc/Drainable;->drainTo(Ljava/io/OutputStream;)I

    move-result p0

    return p0

    .line 276
    :cond_0
    invoke-static {p0, p1}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide p0

    const-wide/32 v0, 0x7fffffff

    cmp-long v2, p0, v0

    if-gtz v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Message size overflow: %s"

    .line 277
    invoke-static {v0, v1, p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    long-to-int p1, p0

    return p1
.end method

.method private writeUncompressed(Ljava/io/InputStream;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    int-to-long v0, p2

    .line 168
    iput-wide v0, p0, Lio/grpc/internal/MessageFramer;->currentMessageWireSize:J

    .line 169
    invoke-direct {p0, p1, p2}, Lio/grpc/internal/MessageFramer;->writeKnownLengthUncompressed(Ljava/io/InputStream;I)I

    move-result p1

    return p1

    .line 171
    :cond_0
    new-instance p2, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lio/grpc/internal/MessageFramer$BufferChainOutputStream;-><init>(Lio/grpc/internal/MessageFramer;Lio/grpc/internal/MessageFramer$1;)V

    .line 172
    invoke-static {p1, p2}, Lio/grpc/internal/MessageFramer;->writeToOutputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    move-result p1

    .line 173
    iget v0, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    const/4 v1, 0x0

    if-ltz v0, :cond_2

    if-gt p1, v0, :cond_1

    goto :goto_0

    .line 174
    :cond_1
    sget-object p2, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 177
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    const/4 p1, 0x1

    iget v1, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, p1

    const-string p1, "message too large %d > %d"

    .line 176
    invoke-static {v0, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 175
    invoke-virtual {p2, p1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    .line 178
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    .line 180
    :cond_2
    :goto_0
    invoke-direct {p0, p2, v1}, Lio/grpc/internal/MessageFramer;->writeBufferChain(Lio/grpc/internal/MessageFramer$BufferChainOutputStream;Z)V

    return p1
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 323
    invoke-virtual {p0}, Lio/grpc/internal/MessageFramer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 324
    iput-boolean v0, p0, Lio/grpc/internal/MessageFramer;->closed:Z

    .line 327
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lio/grpc/internal/WritableBuffer;->readableBytes()I

    move-result v1

    if-nez v1, :cond_0

    .line 328
    invoke-direct {p0}, Lio/grpc/internal/MessageFramer;->releaseBuffer()V

    .line 330
    :cond_0
    invoke-direct {p0, v0, v0}, Lio/grpc/internal/MessageFramer;->commitToSink(ZZ)V

    :cond_1
    return-void
.end method

.method public dispose()V
    .locals 1

    const/4 v0, 0x1

    .line 340
    iput-boolean v0, p0, Lio/grpc/internal/MessageFramer;->closed:Z

    .line 341
    invoke-direct {p0}, Lio/grpc/internal/MessageFramer;->releaseBuffer()V

    return-void
.end method

.method public flush()V
    .locals 2

    .line 303
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->buffer:Lio/grpc/internal/WritableBuffer;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/grpc/internal/WritableBuffer;->readableBytes()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 304
    invoke-direct {p0, v0, v1}, Lio/grpc/internal/MessageFramer;->commitToSink(ZZ)V

    :cond_0
    return-void
.end method

.method public isClosed()Z
    .locals 1

    .line 314
    iget-boolean v0, p0, Lio/grpc/internal/MessageFramer;->closed:Z

    return v0
.end method

.method public bridge synthetic setCompressor(Lio/grpc/Compressor;)Lio/grpc/internal/Framer;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lio/grpc/internal/MessageFramer;->setCompressor(Lio/grpc/Compressor;)Lio/grpc/internal/MessageFramer;

    move-result-object p1

    return-object p1
.end method

.method public setCompressor(Lio/grpc/Compressor;)Lio/grpc/internal/MessageFramer;
    .locals 1

    const-string v0, "Can\'t pass an empty compressor"

    .line 106
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/Compressor;

    iput-object p1, p0, Lio/grpc/internal/MessageFramer;->compressor:Lio/grpc/Compressor;

    return-object p0
.end method

.method public setMaxOutboundMessageSize(I)V
    .locals 2

    .line 118
    iget v0, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "max size already set"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 119
    iput p1, p0, Lio/grpc/internal/MessageFramer;->maxOutboundMessageSize:I

    return-void
.end method

.method public bridge synthetic setMessageCompression(Z)Lio/grpc/internal/Framer;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lio/grpc/internal/MessageFramer;->setMessageCompression(Z)Lio/grpc/internal/MessageFramer;

    move-result-object p1

    return-object p1
.end method

.method public setMessageCompression(Z)Lio/grpc/internal/MessageFramer;
    .locals 0

    .line 112
    iput-boolean p1, p0, Lio/grpc/internal/MessageFramer;->messageCompression:Z

    return-object p0
.end method

.method public writePayload(Ljava/io/InputStream;)V
    .locals 7

    const-string v0, "Failed to frame message"

    .line 129
    invoke-direct {p0}, Lio/grpc/internal/MessageFramer;->verifyNotClosed()V

    .line 130
    iget v1, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lio/grpc/internal/MessageFramer;->messagesBuffered:I

    .line 131
    iget v1, p0, Lio/grpc/internal/MessageFramer;->currentMessageSeqNo:I

    add-int/2addr v1, v2

    iput v1, p0, Lio/grpc/internal/MessageFramer;->currentMessageSeqNo:I

    const-wide/16 v3, 0x0

    .line 132
    iput-wide v3, p0, Lio/grpc/internal/MessageFramer;->currentMessageWireSize:J

    .line 133
    iget-object v3, p0, Lio/grpc/internal/MessageFramer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    invoke-virtual {v3, v1}, Lio/grpc/internal/StatsTraceContext;->outboundMessage(I)V

    .line 134
    iget-boolean v1, p0, Lio/grpc/internal/MessageFramer;->messageCompression:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->compressor:Lio/grpc/Compressor;

    sget-object v4, Lio/grpc/Codec$Identity;->NONE:Lio/grpc/Codec;

    if-eq v1, v4, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 138
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Lio/grpc/internal/MessageFramer;->getKnownLength(Ljava/io/InputStream;)I

    move-result v4

    if-eqz v4, :cond_1

    if-eqz v1, :cond_1

    .line 140
    invoke-direct {p0, p1, v4}, Lio/grpc/internal/MessageFramer;->writeCompressed(Ljava/io/InputStream;I)I

    move-result p1

    goto :goto_1

    .line 142
    :cond_1
    invoke-direct {p0, p1, v4}, Lio/grpc/internal/MessageFramer;->writeUncompressed(Ljava/io/InputStream;I)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    const/4 v0, -0x1

    if-eq v4, v0, :cond_3

    if-ne p1, v4, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 158
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v2

    const-string p1, "Message length inaccurate %s != %s"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 159
    sget-object v0, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    invoke-virtual {v0, p1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    .line 161
    :cond_3
    :goto_2
    iget-object v0, p0, Lio/grpc/internal/MessageFramer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    int-to-long v5, p1

    invoke-virtual {v0, v5, v6}, Lio/grpc/internal/StatsTraceContext;->outboundUncompressedSize(J)V

    .line 162
    iget-object p1, p0, Lio/grpc/internal/MessageFramer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iget-wide v0, p0, Lio/grpc/internal/MessageFramer;->currentMessageWireSize:J

    invoke-virtual {p1, v0, v1}, Lio/grpc/internal/StatsTraceContext;->outboundWireSize(J)V

    .line 163
    iget-object v1, p0, Lio/grpc/internal/MessageFramer;->statsTraceCtx:Lio/grpc/internal/StatsTraceContext;

    iget v2, p0, Lio/grpc/internal/MessageFramer;->currentMessageSeqNo:I

    iget-wide v3, p0, Lio/grpc/internal/MessageFramer;->currentMessageWireSize:J

    invoke-virtual/range {v1 .. v6}, Lio/grpc/internal/StatsTraceContext;->outboundMessageSent(IJJ)V

    return-void

    :catch_0
    move-exception p1

    .line 151
    sget-object v1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    .line 152
    invoke-virtual {v1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 153
    invoke-virtual {v0, p1}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p1

    .line 154
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1

    :catch_1
    move-exception p1

    .line 146
    sget-object v1, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    .line 147
    invoke-virtual {v1, v0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 148
    invoke-virtual {v0, p1}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p1

    .line 149
    invoke-virtual {p1}, Lio/grpc/Status;->asRuntimeException()Lio/grpc/StatusRuntimeException;

    move-result-object p1

    throw p1
.end method
