package cn.com.topit.base;

public interface UrlMatcher_nouse {
	public Object compile(String path);

	public boolean pathMatchesUrl(Object path, String url);

	public String getUniversalMatchPattern();

	public boolean requiresLowerCaseUrl();
}
