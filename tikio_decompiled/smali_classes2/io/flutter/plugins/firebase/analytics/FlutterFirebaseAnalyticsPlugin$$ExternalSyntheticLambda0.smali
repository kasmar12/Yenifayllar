.class public final synthetic Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-static {v0, p1}, Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;->lambda$onMethodCall$0(Lio/flutter/plugin/common/MethodChannel$Result;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
