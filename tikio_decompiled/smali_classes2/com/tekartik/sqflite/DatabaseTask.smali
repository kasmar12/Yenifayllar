.class final Lcom/tekartik/sqflite/DatabaseTask;
.super Ljava/lang/Object;
.source "DatabaseTask.java"


# instance fields
.field private final database:Lcom/tekartik/sqflite/DatabaseDelegate;

.field final runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/tekartik/sqflite/DatabaseDelegate;Ljava/lang/Runnable;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/tekartik/sqflite/DatabaseTask;->database:Lcom/tekartik/sqflite/DatabaseDelegate;

    .line 21
    iput-object p2, p0, Lcom/tekartik/sqflite/DatabaseTask;->runnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public getDatabaseId()Ljava/lang/Integer;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/tekartik/sqflite/DatabaseTask;->database:Lcom/tekartik/sqflite/DatabaseDelegate;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/tekartik/sqflite/DatabaseDelegate;->getDatabaseId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public isInTransaction()Z
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/tekartik/sqflite/DatabaseTask;->database:Lcom/tekartik/sqflite/DatabaseDelegate;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/tekartik/sqflite/DatabaseDelegate;->isInTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
