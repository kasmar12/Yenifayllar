.class public final synthetic Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;->INSTANCE:Lcom/google/firebase/firestore/remote/FirestoreChannel$2$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lio/grpc/ClientCall;

    invoke-virtual {p1}, Lio/grpc/ClientCall;->halfClose()V

    return-void
.end method
