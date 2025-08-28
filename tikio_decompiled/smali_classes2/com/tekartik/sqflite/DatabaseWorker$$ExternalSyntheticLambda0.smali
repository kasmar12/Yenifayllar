.class public final synthetic Lcom/tekartik/sqflite/DatabaseWorker$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/tekartik/sqflite/DatabaseWorker;

.field public final synthetic f$1:Lcom/tekartik/sqflite/DatabaseTask;


# direct methods
.method public synthetic constructor <init>(Lcom/tekartik/sqflite/DatabaseWorker;Lcom/tekartik/sqflite/DatabaseTask;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tekartik/sqflite/DatabaseWorker$$ExternalSyntheticLambda0;->f$0:Lcom/tekartik/sqflite/DatabaseWorker;

    iput-object p2, p0, Lcom/tekartik/sqflite/DatabaseWorker$$ExternalSyntheticLambda0;->f$1:Lcom/tekartik/sqflite/DatabaseTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/tekartik/sqflite/DatabaseWorker$$ExternalSyntheticLambda0;->f$0:Lcom/tekartik/sqflite/DatabaseWorker;

    iget-object v1, p0, Lcom/tekartik/sqflite/DatabaseWorker$$ExternalSyntheticLambda0;->f$1:Lcom/tekartik/sqflite/DatabaseTask;

    invoke-virtual {v0, v1}, Lcom/tekartik/sqflite/DatabaseWorker;->lambda$postTask$0$com-tekartik-sqflite-DatabaseWorker(Lcom/tekartik/sqflite/DatabaseTask;)V

    return-void
.end method
