.class public final synthetic Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/billingclient/api/UserChoiceBillingListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;

.field public final synthetic f$1:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;

    iput-object p2, p0, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    return-void
.end method


# virtual methods
.method public final userSelectedAlternativeBilling(Lcom/android/billingclient/api/UserChoiceDetails;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;

    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/inapppurchase/BillingClientFactoryImpl;->lambda$createUserChoiceBillingListener$0$io-flutter-plugins-inapppurchase-BillingClientFactoryImpl(Lio/flutter/plugins/inapppurchase/Messages$InAppPurchaseCallbackApi;Lcom/android/billingclient/api/UserChoiceDetails;)V

    return-void
.end method
