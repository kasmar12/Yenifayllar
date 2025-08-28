.class Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$1;
.super Ljava/lang/Object;
.source "BillingClientFactoryImpl.java"

# interfaces
.implements Lio/flutter/plugins/inapppurchase/Messages$VoidResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;->createUserChoiceBillingListener(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;)Lcom/android/billingclient/api/UserChoiceBillingListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;


# direct methods
.method constructor <init>(Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$1;->this$0:Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Throwable;)V
    .locals 2

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "userSelectedalternativeBilling handler error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IN_APP_PURCHASE"

    invoke-static {v0, p1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public success()V
    .locals 0

    return-void
.end method
