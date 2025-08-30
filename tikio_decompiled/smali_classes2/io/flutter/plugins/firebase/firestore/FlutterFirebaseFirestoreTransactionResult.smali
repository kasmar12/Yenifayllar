.class public Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;
.super Ljava/lang/Object;
.source "FlutterFirebaseFirestoreTransactionResult.java"


# instance fields
.field public final exception:Ljava/lang/Exception;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->exception:Ljava/lang/Exception;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Exception;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->exception:Ljava/lang/Exception;

    return-void
.end method

.method public static complete()Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;
    .locals 1

    .line 27
    new-instance v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;-><init>()V

    return-object v0
.end method

.method public static failed(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;
    .locals 1

    .line 23
    new-instance v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    invoke-direct {v0, p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;-><init>(Ljava/lang/Exception;)V

    return-object v0
.end method
