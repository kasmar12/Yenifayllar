.class public Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;
.super Ljava/lang/Object;
.source "ExceptionConverter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDetails(Ljava/lang/Exception;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    .line 30
    instance-of v2, p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    if-eqz v2, :cond_1

    .line 31
    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;

    move-object v2, p0

    check-cast v2, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    .line 33
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreException;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 35
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    if-eqz v2, :cond_3

    .line 36
    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;

    .line 38
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    .line 39
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 40
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    :goto_0
    invoke-direct {v1, v2, v3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreException;Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    const-string v2, "code"

    if-eqz v1, :cond_4

    .line 45
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;->getCode()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v3, "message"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    :cond_4
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 50
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "FLTFirebaseFirestore"

    const-string v2, "An unknown error occurred"

    .line 51
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    return-object v0
.end method

.method public static sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V
    .locals 3

    .line 59
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->createDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object v0

    .line 60
    new-instance v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;

    if-eqz p1, :cond_0

    .line 63
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v2, "firebase_firestore"

    invoke-direct {v1, v2, p1, v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    invoke-interface {p0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->error(Ljava/lang/Throwable;)V

    return-void
.end method
