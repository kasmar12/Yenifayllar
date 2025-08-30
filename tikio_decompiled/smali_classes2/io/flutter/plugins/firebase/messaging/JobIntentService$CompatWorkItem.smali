.class final Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;
.super Ljava/lang/Object;
.source "JobIntentService.java"

# interfaces
.implements Lio/flutter/plugins/firebase/messaging/JobIntentService$GenericWorkItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/messaging/JobIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CompatWorkItem"
.end annotation


# instance fields
.field final mIntent:Landroid/content/Intent;

.field final mStartId:I

.field final synthetic this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;


# direct methods
.method constructor <init>(Lio/flutter/plugins/firebase/messaging/JobIntentService;Landroid/content/Intent;I)V
    .locals 0

    .line 327
    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    iput-object p2, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->mIntent:Landroid/content/Intent;

    .line 329
    iput p3, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->mStartId:I

    return-void
.end method


# virtual methods
.method public complete()V
    .locals 2

    .line 340
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->this$0:Lio/flutter/plugins/firebase/messaging/JobIntentService;

    iget v1, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->mStartId:I

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->stopSelf(I)V

    return-void
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .line 334
    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/JobIntentService$CompatWorkItem;->mIntent:Landroid/content/Intent;

    return-object v0
.end method
