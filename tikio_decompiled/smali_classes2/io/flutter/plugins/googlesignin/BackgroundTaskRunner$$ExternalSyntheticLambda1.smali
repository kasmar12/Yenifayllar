.class public final synthetic Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;

.field public final synthetic f$1:Lcom/google/common/util/concurrent/ListenableFuture;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;

    iput-object p2, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda1;->f$1:Lcom/google/common/util/concurrent/ListenableFuture;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;

    iget-object v1, p0, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$$ExternalSyntheticLambda1;->f$1:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0, v1}, Lio/flutter/plugins/googlesignin/BackgroundTaskRunner;->lambda$runInBackground$0(Lio/flutter/plugins/googlesignin/BackgroundTaskRunner$Callback;Lcom/google/common/util/concurrent/ListenableFuture;)V

    return-void
.end method
