.class public final synthetic Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;

.field public final synthetic f$1:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;

    iput-object p2, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;

    iget-object v1, p0, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin$$ExternalSyntheticLambda0;->f$1:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/functions/FlutterFirebaseFunctionsPlugin;->lambda$onMethodCall$1$io-flutter-plugins-firebase-functions-FlutterFirebaseFunctionsPlugin(Lio/flutter/plugin/common/MethodChannel$Result;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
