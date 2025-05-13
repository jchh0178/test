import json
import mysql.connector
from mysql.connector import Error
import matplotlib.pyplot as plt
import os
import sys

# 커맨드라인 인자로 movieId 받기
if len(sys.argv) < 2:
    print("사용법: python chart.py <movieId>")
    sys.exit(1)

target_movie_id = sys.argv[1]  # 인자로 받은 movieId

HOST = "itwillbs.com"
USER = "c3d2501t2p1"
PASSWORD = "1234"
DATABASE = "c3d2501t2p1"

def connect_to_mysql(host_name, user_name, user_password, db_name=None):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name, port=3306, user=user_name, passwd=user_password, database=db_name
        )
        print("MySQL 데이터베이스 연결 성공")
    except Error as err:
        print(f"Error: '{err}'")
    return connection

def read_query(connection, query, params=None):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query, params)
        result = cursor.fetchall()
        return result
    except Error as err:
        print(f"Error: '{err}'")
        return None
    finally:
        cursor.close()

def main():
    connection = connect_to_mysql(HOST, USER, PASSWORD, DATABASE)
    if not connection:
        return

    # 해당 movieId 리뷰만 조회
    query = "SELECT * FROM review WHERE movie_id = %s"
    reviews_raw = read_query(connection, query, (target_movie_id,))

    if not reviews_raw:
        print(f"movie_id {target_movie_id}에 해당하는 리뷰가 없습니다.")
        return

    sentiment_count = {"positive": 0, "negative": 0, "null": 0}

    for review in reviews_raw:
        if review[-1] == "positive":
            sentiment_count["positive"] += 1
        elif review[-1] == "negative":
            sentiment_count["negative"] += 1
        else:
            sentiment_count["null"] += 1

    filtered_data = {k: v for k, v in sentiment_count.items() if v > 0}
    if not filtered_data:
        print(f"{target_movie_id}에 대한 유효한 감정 데이터가 없습니다.")
        return

    color_map = {"positive": "#66B3FF", "negative": "#FF9999", "null": "#C0C0C0"}
    values = list(filtered_data.values())
    colors = [color_map[k] for k in filtered_data.keys()]
    explode = [0.05] * len(filtered_data)

    plt.figure(figsize=(8, 6))
    plt.pie(
        values,
        labels=None,
        autopct=lambda pct: f"{pct:.1f}%",
        startangle=90,
        colors=colors,
        shadow=True,
        explode=explode,
        textprops={"fontsize": 12},
    )

    all_labels = [f"{k} ({v})" for k, v in sentiment_count.items()]
    handles = []
    for i, (label, color) in enumerate(zip(all_labels, [color_map[k] for k in sentiment_count.keys()])):
        if sentiment_count[list(sentiment_count.keys())[i]] > 0:
            handles.append(plt.Rectangle((0, 0), 1, 1, color=color))
        else:
            handles.append(plt.Rectangle((0, 0), 1, 1, color=color, alpha=0.5))

    plt.legend(handles, all_labels, loc="best", fontsize=10)
    plt.axis("equal")
    plt.tight_layout()

    save_dir = "C:/Users/admin/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/teamProjectTest/resources/py_chart/pie_charts"
    os.makedirs(save_dir, exist_ok=True)
    save_path = f"{save_dir}/{target_movie_id}.png"

    # ✅ 기존 파일 삭제 (안전한 덮어쓰기 보장)
    if os.path.exists(save_path):
        os.remove(save_path)
        print(f"🔁 기존 파일 삭제: {save_path}")
    else:
        print(f"📁 새 파일 저장 예정: {save_path}")

    plt.savefig(save_path)
    print(f"✅ 차트 저장 완료: {save_path}")
    plt.close()

    print(f"movie_id {target_movie_id} 차트 저장 완료.")

if __name__ == "__main__":
    main()
