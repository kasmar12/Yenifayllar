.class final Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;
.super Lio/grpc/internal/DelayedClientCall;
.source "ManagedChannelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/ManagedChannelImpl$RealChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PendingCall"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReqT:",
        "Ljava/lang/Object;",
        "RespT:",
        "Ljava/lang/Object;",
        ">",
        "Lio/grpc/internal/DelayedClientCall<",
        "TReqT;TRespT;>;"
    }
.end annotation


# instance fields
.field final callOptions:Lio/grpc/CallOptions;

.field final context:Lio/grpc/Context;

.field final method:Lio/grpc/MethodDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/MethodDescriptor<",
            "TReqT;TRespT;>;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;


# direct methods
.method constructor <init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel;Lio/grpc/Context;Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/Context;",
            "Lio/grpc/MethodDescriptor<",
            "TReqT;TRespT;>;",
            "Lio/grpc/CallOptions;",
            ")V"
        }
    .end annotation

    .line 1090
    iput-object p1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    .line 1091
    iget-object v0, p1, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {v0, p4}, Lio/grpc/internal/ManagedChannelImpl;->access$2200(Lio/grpc/internal/ManagedChannelImpl;Lio/grpc/CallOptions;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object p1, p1, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    invoke-static {p1}, Lio/grpc/internal/ManagedChannelImpl;->access$4400(Lio/grpc/internal/ManagedChannelImpl;)Lio/grpc/internal/ManagedChannelImpl$RestrictedScheduledExecutor;

    move-result-object p1

    invoke-virtual {p4}, Lio/grpc/CallOptions;->getDeadline()Lio/grpc/Deadline;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1}, Lio/grpc/internal/DelayedClientCall;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Lio/grpc/Deadline;)V

    .line 1092
    iput-object p2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->context:Lio/grpc/Context;

    .line 1093
    iput-object p3, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->method:Lio/grpc/MethodDescriptor;

    .line 1094
    iput-object p4, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->callOptions:Lio/grpc/CallOptions;

    return-void
.end method


# virtual methods
.method protected callCancelled()V
    .locals 2

    .line 1122
    invoke-super {p0}, Lio/grpc/internal/DelayedClientCall;->callCancelled()V

    .line 1123
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;

    invoke-direct {v1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method reprocess()V
    .locals 4

    .line 1100
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->context:Lio/grpc/Context;

    invoke-virtual {v0}, Lio/grpc/Context;->attach()Lio/grpc/Context;

    move-result-object v0

    .line 1102
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->method:Lio/grpc/MethodDescriptor;

    iget-object v3, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->callOptions:Lio/grpc/CallOptions;

    invoke-static {v1, v2, v3}, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->access$4500(Lio/grpc/internal/ManagedChannelImpl$RealChannel;Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1104
    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->context:Lio/grpc/Context;

    invoke-virtual {v2, v0}, Lio/grpc/Context;->detach(Lio/grpc/Context;)V

    .line 1106
    invoke-virtual {p0, v1}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->setCall(Lio/grpc/ClientCall;)Ljava/lang/Runnable;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1108
    iget-object v0, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    iget-object v0, v0, Lio/grpc/internal/ManagedChannelImpl;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;

    invoke-direct {v1, p0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$PendingCallRemoval;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;)V

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1110
    :cond_0
    iget-object v1, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->this$1:Lio/grpc/internal/ManagedChannelImpl$RealChannel;

    iget-object v1, v1, Lio/grpc/internal/ManagedChannelImpl$RealChannel;->this$0:Lio/grpc/internal/ManagedChannelImpl;

    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->callOptions:Lio/grpc/CallOptions;

    invoke-static {v1, v2}, Lio/grpc/internal/ManagedChannelImpl;->access$2200(Lio/grpc/internal/ManagedChannelImpl;Lio/grpc/CallOptions;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;

    invoke-direct {v2, p0, v0}, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall$1;-><init>(Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;Ljava/lang/Runnable;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :catchall_0
    move-exception v1

    .line 1104
    iget-object v2, p0, Lio/grpc/internal/ManagedChannelImpl$RealChannel$PendingCall;->context:Lio/grpc/Context;

    invoke-virtual {v2, v0}, Lio/grpc/Context;->detach(Lio/grpc/Context;)V

    throw v1
.end method
