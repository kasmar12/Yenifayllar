.class Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;
.super Ljava/lang/Object;
.source "MethodCallHandlerImpl.java"

# interfaces
.implements Lcom/android/billingclient/api/BillingClientStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->startConnection(Ljava/lang/Long;Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private alreadyFinished:Z

.field final synthetic this$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

.field final synthetic val$handle:Ljava/lang/Long;

.field final synthetic val$result:Lio/flutter/plugins/inapppurchase/Messages$Result;


# direct methods
.method constructor <init>(Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;Lio/flutter/plugins/inapppurchase/Messages$Result;Ljava/lang/Long;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 468
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->this$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    iput-object p2, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->val$result:Lio/flutter/plugins/inapppurchase/Messages$Result;

    iput-object p3, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->val$handle:Ljava/lang/Long;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 469
    iput-boolean p1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->alreadyFinished:Z

    return-void
.end method


# virtual methods
.method public onBillingServiceDisconnected()V
    .locals 3

    .line 485
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->this$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    iget-object v0, v0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->callbackApi:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->val$handle:Ljava/lang/Long;

    new-instance v2, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1$1;

    invoke-direct {v2, p0}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1$1;-><init>(Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;)V

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;->onBillingServiceDisconnected(Ljava/lang/Long;Lio/flutter/plugins/inapppurchase/Messages$VoidResult;)V

    return-void
.end method

.method public onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
    .locals 1

    .line 473
    iget-boolean v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->alreadyFinished:Z

    if-eqz v0, :cond_0

    const-string p1, "InAppPurchasePlugin"

    const-string v0, "Tried to call onBillingSetupFinished multiple times."

    .line 474
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 477
    iput-boolean v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->alreadyFinished:Z

    .line 480
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$1;->val$result:Lio/flutter/plugins/inapppurchase/Messages$Result;

    invoke-static {p1}, Lio/flutter/plugins/inapppurchase/Translator;->fromBillingResult(Lcom/android/billingclient/api/BillingResult;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingResult;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/flutter/plugins/inapppurchase/Messages$Result;->success(Ljava/lang/Object;)V

    return-void
.end method
