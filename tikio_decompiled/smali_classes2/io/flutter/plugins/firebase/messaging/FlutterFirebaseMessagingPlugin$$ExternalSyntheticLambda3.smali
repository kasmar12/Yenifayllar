.class public final synthetic Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;Ljava/util/Map;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    iput-object p2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$1:Ljava/util/Map;

    iput-object p3, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$2:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    iget-object v1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$1:Ljava/util/Map;

    iget-object v2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda3;->f$2:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;->lambda$setAutoInitEnabled$7$io-flutter-plugins-firebase-messaging-FlutterFirebaseMessagingPlugin(Ljava/util/Map;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
