.class public final synthetic Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/SettableFuture;

.field public final synthetic f$1:Ljava/util/concurrent/Callable;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/SettableFuture;Ljava/util/concurrent/Callable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda0;->f$0:Lcom/google/common/util/concurrent/SettableFuture;

    iput-object p2, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/Callable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda0;->f$0:Lcom/google/common/util/concurrent/SettableFuture;

    iget-object v1, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/Callable;

    invoke-static {v0, v1}, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner;->lambda$runInBackground$1(Lcom/google/common/util/concurrent/SettableFuture;Ljava/util/concurrent/Callable;)V

    return-void
.end method
