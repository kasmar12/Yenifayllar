.class final Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;
.super Landroid/os/AsyncTask;
.source "JobIntentService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/messaging/JobIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CommandProcessor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;


# direct methods
.method constructor <init>(Lio/flutter/plugins/firebase/messaging/JobIntentService;)V
    .locals 0

    .line 345
    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 345
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2

    .line 352
    :goto_0
    iget-object p1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->dequeueWork()Lio/flutter/plugins/firebase/messaging/JobIntentService$GenericWorkItem;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 354
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-interface {p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService$GenericWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onHandleWork(Landroid/content/Intent;)V

    .line 356
    invoke-interface {p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService$GenericWorkItem;->complete()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .line 345
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->onCancelled(Ljava/lang/Void;)V

    return-void
.end method

.method protected onCancelled(Ljava/lang/Void;)V
    .locals 0

    .line 366
    iget-object p1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->processorFinished()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 345
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0

    .line 371
    iget-object p1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CommandProcessor;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->processorFinished()V

    return-void
.end method
