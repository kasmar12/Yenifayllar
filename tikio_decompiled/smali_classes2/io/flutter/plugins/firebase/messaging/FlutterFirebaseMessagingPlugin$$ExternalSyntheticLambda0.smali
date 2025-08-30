.class public final synthetic Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;

    check-cast p1, Lcom/google/firebase/messaging/RemoteMessage;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingPlugin;->lambda$initInstance$0$io-flutter-plugins-firebase-messaging-FlutterFirebaseMessagingPlugin(Lcom/google/firebase/messaging/RemoteMessage;)V

    return-void
.end method
