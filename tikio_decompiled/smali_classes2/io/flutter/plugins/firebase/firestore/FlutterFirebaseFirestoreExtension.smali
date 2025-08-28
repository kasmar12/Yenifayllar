.class public Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;
.super Ljava/lang/Object;
.source "FlutterFirebaseFirestoreExtension.java"


# instance fields
.field private final databaseURL:Ljava/lang/String;

.field private final instance:Lcom/google/firebase/firestore/FirebaseFirestore;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->instance:Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 15
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->databaseURL:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDatabaseURL()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->databaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getInstance()Lcom/google/firebase/firestore/FirebaseFirestore;
    .locals 1

    .line 19
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->instance:Lcom/google/firebase/firestore/FirebaseFirestore;

    return-object v0
.end method
