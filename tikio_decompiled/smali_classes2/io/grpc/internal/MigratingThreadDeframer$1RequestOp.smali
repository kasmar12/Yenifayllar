.class Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;
.super Ljava/lang/Object;
.source "MigratingThreadDeframer.java"

# interfaces
.implements Lio/grpc/internal/MigratingThreadDeframer$Op;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/grpc/internal/MigratingThreadDeframer;->request(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RequestOp"
.end annotation


# instance fields
.field final synthetic this$0:Lio/grpc/internal/MigratingThreadDeframer;

.field final synthetic val$numMessages:I


# direct methods
.method constructor <init>(Lio/grpc/internal/MigratingThreadDeframer;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 140
    iput-object p1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    iput p2, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->val$numMessages:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 143
    invoke-static {}, Lio/perfmark/PerfMark;->linkOut()Lio/perfmark/Link;

    move-result-object p1

    .line 146
    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    invoke-static {v0}, Lio/grpc/internal/MigratingThreadDeframer;->access$300(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;

    move-result-object v0

    new-instance v1, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;

    invoke-direct {v1, p0, p1}, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp$1;-><init>(Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;Lio/perfmark/Link;)V

    invoke-interface {v0, v1}, Lio/grpc/internal/ApplicationThreadDeframerListener$TransportExecutor;->runOnTransportThread(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    const-string p1, "MigratingThreadDeframer.request"

    .line 162
    invoke-static {p1}, Lio/perfmark/PerfMark;->startTask(Ljava/lang/String;)V

    .line 164
    :try_start_0
    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    invoke-static {v0}, Lio/grpc/internal/MigratingThreadDeframer;->access$400(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MessageDeframer;

    move-result-object v0

    iget v1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->val$numMessages:I

    invoke-virtual {v0, v1}, Lio/grpc/internal/MessageDeframer;->request(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    :goto_0
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 166
    :try_start_1
    iget-object v1, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    invoke-static {v1}, Lio/grpc/internal/MigratingThreadDeframer;->access$500(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/ApplicationThreadDeframerListener;

    move-result-object v1

    invoke-virtual {v1, v0}, Lio/grpc/internal/ApplicationThreadDeframerListener;->deframeFailed(Ljava/lang/Throwable;)V

    .line 167
    iget-object v0, p0, Lio/grpc/internal/MigratingThreadDeframer$1RequestOp;->this$0:Lio/grpc/internal/MigratingThreadDeframer;

    invoke-static {v0}, Lio/grpc/internal/MigratingThreadDeframer;->access$400(Lio/grpc/internal/MigratingThreadDeframer;)Lio/grpc/internal/MessageDeframer;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/internal/MessageDeframer;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :goto_1
    return-void

    :catchall_1
    move-exception v0

    .line 169
    invoke-static {p1}, Lio/perfmark/PerfMark;->stopTask(Ljava/lang/String;)V

    throw v0
.end method
