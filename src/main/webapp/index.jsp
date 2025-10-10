<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Resume Builder</title>
  <link rel="stylesheet" href="css/style.css"/>
  <script>
    function addField(sectionId, templateHtml) {
      const section = document.getElementById(sectionId);
      const div = document.createElement('div');
      div.innerHTML = templateHtml;
      section.appendChild(div);
    }
  </script>
</head>
<body>
<div class="container">
  <h1>Resume Builder on <%= java.net.InetAddress.getLocalHost().getHostName() %></h1>
  <form action="build" method="post">
    <section>
      <h2>Basic Info</h2>
      <label>Name: <input type="text" name="name" required></label>
      <label>Email: <input type="email" name="email"></label>
      <label>Phone: <input type="text" name="phone"></label>
    </section>

    <section>
      <h2>Summary</h2>
      <textarea name="summary" rows="4"></textarea>
    </section>

    <section>
      <h2>Education</h2>
      <div id="education">
        <div>
          <input type="text" name="edu_title" placeholder="Degree / Institution">
          <input type="text" name="edu_year" placeholder="Year / Range">
        </div>
      </div>
      <button type="button" onclick="addField('education', '<div><input type=\'text\' name=\'edu_title\' placeholder=\'Degree / Institution\'><input type=\'text\' name=\'edu_year\' placeholder=\'Year / Range\'></div>')">Add Education</button>
    </section>

    <section>
      <h2>Experience</h2>
      <div id="experience">
        <div>
          <input type="text" name="exp_title" placeholder="Job Title">
          <input type="text" name="exp_company" placeholder="Company">
          <input type="text" name="exp_duration" placeholder="Duration">
        </div>
      </div>
      <button type="button" onclick="addField('experience', '<div><input type=\'text\' name=\'exp_title\' placeholder=\'Job Title\'><input type=\'text\' name=\'exp_company\' placeholder=\'Company\'><input type=\'text\' name=\'exp_duration\' placeholder=\'Duration\'></div>')">Add Experience</button>
    </section>

    <section>
      <h2>Skills</h2>
      <div id="skills">
        <input type="text" name="skills" placeholder="Skill">
      </div>
      <button type="button" onclick="addField('skills', '<input type=\'text\' name=\'skills\' placeholder=\'Skill\'>')">Add Skill</button>
    </section>

    <div class="actions">
      <button type="submit" formaction="build" formtarget="_blank">Preview</button>
      <button type="submit" formaction="save" style="background:green;color:white;">Save</button>
      <a href="list" class="button">View Saved Resumes</a>
    </div>
<p> GIT Publish Date: 9 Oct 2025 16:30 </p>

  </form>
</div>
</body>
</html>

