.class public final synthetic Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/ProductDetailsResponseListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

.field public final synthetic f$1:Lio/flutter/plugins/inapppurchase/Messages$Result;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;Lio/flutter/plugins/inapppurchase/Messages$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda6;->f$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    iput-object p2, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda6;->f$1:Lio/flutter/plugins/inapppurchase/Messages$Result;

    return-void
.end method


# virtual methods
.method public final onProductDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda6;->f$0:Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl$$ExternalSyntheticLambda6;->f$1:Lio/flutter/plugins/inapppurchase/Messages$Result;

    invoke-virtual {v0, v1, p1, p2}, Lio/flutter/plugins/inapppurchase/MethodCallHandlerImpl;->lambda$queryProductDetailsAsync$4$io-flutter-plugins-inapppurchase-MethodCallHandlerImpl(Lio/flutter/plugins/inapppurchase/Messages$Result;Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method
