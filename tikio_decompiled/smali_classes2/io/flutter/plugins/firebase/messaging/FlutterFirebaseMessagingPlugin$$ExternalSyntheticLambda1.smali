.class public final synthetic Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

.field public final synthetic f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    iput-object p2, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda1;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    iget-object v1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda1;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;->lambda$getToken$3$io-flutter-plugins-firebase-messaging-FlutterFirebaseMessagingPlugin(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
