.class public final synthetic Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Boolean;

.field public final synthetic f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;->f$0:Ljava/lang/Boolean;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;->f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;->f$0:Ljava/lang/Boolean;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;->f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;

    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->lambda$setLoggingEnabled$9(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    return-void
.end method
