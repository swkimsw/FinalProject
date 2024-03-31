function goToLink(url) {
    window.location.href = url;
  }
  window.addEventListener('DOMContentLoaded', (event) => {
      const atagElements = document.getElementsByClassName('atag');
      Array.from(atagElements).forEach((element) => {
          const maxWidth = element.offsetWidth;
          const text = element.textContent;
          const fontSize = getComputedStyle(element).fontSize;

          let shortenedText = text;
          while (element.scrollWidth > maxWidth) {
              shortenedText = shortenedText.slice(0, -1);
              element.textContent = shortenedText + '...';
          }

          element.style.fontSize = fontSize;
      });
  });
      $(document).ready(function() {
          $("td.b1").each(function() {
              if ($(this).text() === "자유 게시판") {
                  $(this).html("&#127803;자유 게시판");
              } else if ($(this).text() === "후기 게시판") {
                  $(this).html("&#127804;후기 게시판");
              } else if ($(this).text() === "문의 게시판") {
                  $(this).html("&#127801;문의 게시판");
              }
          });
          $("td.b2").each(function() {
              if ($(this).text() === "일상") {
                  $(this).html("🍿일상");
              } else if ($(this).text() === "정보") {
                  $(this).html("🕵️‍♂️정보");
              } else if ($(this).text() === "질문") {
                  $(this).html("🙋‍♀️질문");
              } else if ($(this).text() === "후기") {
                  $(this).html("🤷후기");
              }
          });
          $("#text").each(function() {
              if ($(this).text() === "Search:") {
                  $(this).html("검색");
              }
          })
      });
      $(document).ready(function() {

          $('#myTables').DataTable({
              pagingType : "full_numbers",
              info : false,
              lengthChange: false,
          });
          $('.dataTables_empty').text('내가 쓴 게시물이 없어요');
      });