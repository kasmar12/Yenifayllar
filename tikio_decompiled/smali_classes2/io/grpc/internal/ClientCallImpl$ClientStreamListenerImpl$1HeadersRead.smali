.class final Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;
.super Lio/grpc/internal/ContextRunnable;
.source "ClientCallImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->headersRead(Lio/grpc/Metadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "HeadersRead"
.end annotation


# instance fields
.field final synthetic this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

.field final synthetic val$headers:Lio/grpc/Metadata;

.field final synthetic val$link:Lio/perfmark/Link;


# direct methods
.method constructor <init>(Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;Lio/perfmark/Link;Lio/grpc/Metadata;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 610
    iput-object p1, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    iput-object p2, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->val$link:Lio/perfmark/Link;

    iput-object p3, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->val$headers:Lio/grpc/Metadata;

    .line 611
    iget-object p1, p1, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->this$0:Lio/grpc/internal/ClientCallImpl;

    invoke-static {p1}, Lio/grpc/internal/ClientCallImpl;->access$200(Lio/grpc/internal/ClientCallImpl;)Lio/grpc/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/grpc/internal/ContextRunnable;-><init>(Lio/grpc/Context;)V

    return-void
.end method

.method private runInternal()V
    .locals 3

    .line 626
    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    invoke-static {v0}, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->access$500(Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;)Lio/grpc/Status;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    .line 630
    :cond_0
    :try_start_0
    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    invoke-static {v0}, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->access$600(Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;)Lio/grpc/ClientCall$Listener;

    move-result-object v0

    iget-object v1, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->val$headers:Lio/grpc/Metadata;

    invoke-virtual {v0, v1}, Lio/grpc/ClientCall$Listener;->onHeaders(Lio/grpc/Metadata;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 632
    iget-object v1, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    sget-object v2, Lio/grpc/Status;->CANCELLED:Lio/grpc/Status;

    .line 633
    invoke-virtual {v2, v0}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object v0

    const-string v2, "Failed to read headers"

    invoke-virtual {v0, v2}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v0

    .line 632
    invoke-static {v1, v0}, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->access$700(Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;Lio/grpc/Status;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public runInContext()V
    .locals 3

    .line 616
    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    iget-object v0, v0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->this$0:Lio/grpc/internal/ClientCallImpl;

    invoke-static {v0}, Lio/grpc/internal/ClientCallImpl;->access$400(Lio/grpc/internal/ClientCallImpl;)Lio/perfmark/Tag;

    move-result-object v0

    const-string v1, "ClientCall$Listener.headersRead"

    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    .line 617
    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->val$link:Lio/perfmark/Link;

    invoke-static {v0}, Lio/perfmark/PerfMark;->linkIn(Lio/perfmark/Link;)V

    .line 619
    :try_start_0
    invoke-direct {p0}, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->runInternal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 621
    iget-object v0, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    iget-object v0, v0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->this$0:Lio/grpc/internal/ClientCallImpl;

    invoke-static {v0}, Lio/grpc/internal/ClientCallImpl;->access$400(Lio/grpc/internal/ClientCallImpl;)Lio/perfmark/Tag;

    move-result-object v0

    invoke-static {v1, v0}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl$1HeadersRead;->this$1:Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;

    iget-object v2, v2, Lio/grpc/internal/ClientCallImpl$ClientStreamListenerImpl;->this$0:Lio/grpc/internal/ClientCallImpl;

    invoke-static {v2}, Lio/grpc/internal/ClientCallImpl;->access$400(Lio/grpc/internal/ClientCallImpl;)Lio/perfmark/Tag;

    move-result-object v2

    invoke-static {v1, v2}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    throw v0
.end method
