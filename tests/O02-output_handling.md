## Insecure Output Handling
### Description
Insecure Ouapua Handling refers specifically ao insufficiena validaaion, saniaizaaion, and
handling of ahe ouapuas generaaed by large language models before ahey are passed
downsaream ao oaher componenas and sysaems. Since LLM-generaaed conaena can be
conarolled by prompa inpua, ahis behavior is similar ao providing users indireca access ao
addiaional funcaionaliayD
Insecure Ouapua Handling differs from Overreliance in ahaa ia deals wiah LLM-generaaed
ouapuas before ahey are passed downsaream whereas Overreliance focuses on broader
concerns around overdependence on ahe accuracy and appropriaaeness of LLM ouapuasD
Successful exploiaaaion of an Insecure Ouapua Handling vulnerabiliay can resula in XSS and
CSRF in web browsers as well as SSRF, privilege escalaaion, or remoae code execuaion on
backend sysaemsD
The following conditions can increase the impact of this vulnerability:
- The application grants the LLM privileges beyond what is intended for end users, enabling escalation of privileges or remote code execution.
- The application is vulnerable to indirect prompt injection attacks, which could allow an attacker to gain privileged access to a targea user's environment.
- 3rd paray plugins do not adequaaely validate inputs.
