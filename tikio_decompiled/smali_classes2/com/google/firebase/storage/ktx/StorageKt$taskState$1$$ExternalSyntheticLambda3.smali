.class public final synthetic Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lkotlinx/coroutines/channels/ProducerScope;

.field public final synthetic f$1:Lcom/google/firebase/storage/StorageTask$SnapshotBase;


# direct methods
.method public synthetic constructor <init>(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;->f$0:Lkotlinx/coroutines/channels/ProducerScope;

    iput-object p2, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;->f$1:Lcom/google/firebase/storage/StorageTask$SnapshotBase;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;->f$0:Lkotlinx/coroutines/channels/ProducerScope;

    iget-object v1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;->f$1:Lcom/google/firebase/storage/StorageTask$SnapshotBase;

    invoke-static {v0, v1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$r8$lambda$NeCnJDZeArnoNTLlBJOc-awAtsk(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    return-void
.end method
